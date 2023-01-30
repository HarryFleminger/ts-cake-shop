class OrdersController < ApplicationController
  def index
  end

  def create
    order = Order.find(params[:order_id])
    product = order.line_items.first.product
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price: price_cents,
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.where(state: 'pending').find(params[:id])
  end
end
