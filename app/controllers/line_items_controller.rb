class LineItemsController < ApplicationController

  def destroy
    @order = Order.find(params[:order_id])
    @line_item = @order.line_items.find(params[:id])
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to @order, notice: 'Line item was successfully destroyed.' }
      format.js { render }
    end
  end

  def create
    product = Product.find(params[:product_id])
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

  private

  def line_item_params
    params.require(:line_item).permit(:quantity)
  end

  def product_params
    params.require(:product_id)
  end
end
