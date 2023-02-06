class LineItemsController < ApplicationController

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
    current_order = current_user.orders.where(state: 'pending')
    if current_order.empty?
      new_order = Order.create(id: Order.all.count + 1, user: current_user)
      line_item = LineItem.new(quantity: line_item_params[:quantity], comment: line_item_params[:comment], product: product, order_id: new_order.id)
      line_item.save
      redirect_to order_path(current_order.last)
    elsif current_order.first.line_items.where(product_id: product.id).present?
      current_line_item = current_order.first.line_items.where(product_id: product.id).last
      current_line_item.quantity = line_item_params[:quantity]
      current_line_item.comment = line_item_params[:comment] if line_item_params[:comment].present?
      current_line_item.save
      redirect_to order_path(current_order.last)
    else
      LineItem.create(quantity: line_item_params[:quantity], comment: line_item_params[:comment], product: product, order_id: current_order.last.id)
      redirect_to order_path(current_order.last)
    end

  end

  def delete_line
    raise
  end

  private

  def line_item_params
    params.require(:line_item).permit(:id, :quantity, :comment)
  end

  def order_params
    params.require(:order_id)
  end

  def product_params
    params.require(:product_id)
  end

end
