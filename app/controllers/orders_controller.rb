class OrdersController < ApplicationController
  include Rails.application.routes.url_helpers

  def index
    @orders = current_user.orders
  end

  def create
    order = Order.find(params[:order_id])
    line_items = []
    order.line_items.each do |item|
      line_items << {
        name: item.product.name,
        amount: item.product.price_cents,
        currency: 'gbp',
        quantity: item.quantity
      }
    end
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: line_items,
      success_url: order_order_completed_url(order),
      cancel_url: order_order_failed_url(order)
    )
    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def update_quantity
    current_order = current_user.orders.where(state: 'pending').first
    current_line_item = LineItem.find(product_params[:id])
    current_line_item.quantity = product_params["line_items"]["quantity"].to_i
    current_line_item.save
    redirect_to order_path(current_order)
  end

  def show
    @current_order = current_user.orders.where(state: 'pending').last
    @order = Order.find(params[:id])
    render :current_order unless params.key?(:user_id)
  end


  def order_completed
    @order = Order.find(params[:order_id])
  end

  def order_failed
    @order = Order.find(params[:order_id])
  end

  private

  def product_params
    params.require(:line_item).permit(:id, line_items: [:quantity])
  end
end
