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
end
