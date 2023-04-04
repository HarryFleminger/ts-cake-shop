class OrdersController < ApplicationController
  include Rails.application.routes.url_helpers

  def index
    @orders = current_user.orders
  end

  def create
    order = Order.find(params[:order_id])
    line_items = []
    order_cost = 0
    line_item_cost = 0
    order.line_items.each do |item|
      line_item_cost = item.product.price_cents * item.quantity
      order_cost += line_item_cost
      line_item_cost = 0
      line_items << {
        name: item.product.name,
        amount: item.product.price_cents,
        images: [item.product.photos.first.url],
        currency: 'gbp',
        quantity: item.quantity
      }
    end
    order.amount_cents = order_cost
    order.save
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      shipping_address_collection: {allowed_countries: ["GB"] },
      shipping_options: [
        {
          shipping_rate_data: {
            type: 'fixed_amount',
            fixed_amount: {amount: 0, currency: 'gbp'},
            display_name: 'Free shipping',
            delivery_estimate: {
              minimum: {unit: 'business_day', value: 5},
              maximum: {unit: 'business_day', value: 7},
            },
          },
        },
      ],
      line_items: line_items,
      success_url: order_order_completed_url(order, order_id: order.id),
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
    ShopOrderMailer.order_confirmation(@order).deliver_now
    @order.state = "completed"
    @order.save
    @shipping_address = retrieve_shipping_address(@order.checkout_session_id)
  end

  def order_failed
    @order = Order.find(params[:order_id])
    flash[:notice] = "Payment failed. Please try again."
    redirect_to order_url(params[:order_id])
  end

  private

  def product_params
    params.require(:line_item).permit(:id, line_items: [:quantity])
  end

  def retrieve_shipping_address(checkout_session_id)
    session = Stripe::Checkout::Session.retrieve(checkout_session_id)
    session.shipping
  end
end
