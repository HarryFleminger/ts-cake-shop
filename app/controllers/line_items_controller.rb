class LineItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  before_action :check_logged_in, only: [:create]
  def destroy
    current_order = current_user.orders.where(state: 'pending').last
    line_item = LineItem.find(params[:id].to_i)
    line_item.destroy
    if current_order.line_items.empty?
      respond_to do |format|
        format.html { redirect_to products_path, notice: 'Product was successfully removed from basket.' }
        format.js { render }
      end
    else
      respond_to do |format|
        format.html { redirect_to current_order, notice: 'Product was successfully removed from basket.' }
        format.js { render }
      end
    end
  end

  def create
    product = Product.find(params[:product_id])
    product.in_stock = false if product.stock_count == 0
    current_order = current_user.orders.where(state: 'pending')
    if current_order.empty?
      new_order = Order.create(id: Order.all.count + 1, user: current_user)
      line_item = LineItem.new(quantity: line_item_params[:quantity], product: product, order_id: new_order.id)
      line_item.save
      redirect_to order_path(current_order.last)
    elsif current_order.first.line_items.where(product_id: product.id).present?
      current_line_item = current_order.first.line_items.where(product_id: product.id).last
      current_line_item.quantity = line_item_params[:quantity]
      current_line_item.save
      redirect_to order_path(current_order.last)
    else
      LineItem.create(quantity: line_item_params[:quantity], product: product, order_id: current_order.last.id)
      redirect_to order_path(current_order.last)
    end

  end

  def delete_line
    raise
  end

  private

  def line_item_params
    params.require(:line_item).permit(:id, :quantity)
  end

  def order_params
    params.require(:order_id)
  end

  def product_params
    params.require(:product_id)
  end

  def check_logged_in
    unless current_user.present?
      redirect_back(fallback_location: root_path, alert: "Please login to continue.")
    end
  end

end
