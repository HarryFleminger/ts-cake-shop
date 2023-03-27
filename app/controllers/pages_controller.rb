class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @products = Product.all
  end

  def order_managment
    if current_user.admin
      @requests = Request.all
    else
      @requests = current_user.requests
    end
  end

  def order_managment_shop
    if current_user.admin
      @orders = Order.all
    else
      @orders = current_user.orders
    end
  end

  def send_payment
    @request = Request.find(params[:request_id])
    # @request.update(paid_status: "paid")
    line_item = {
      name: @request.custom_cake.name,
      amount: @request.custom_cake.price_cents,
      currency: 'gbp',
      quantity: 1
    }
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [line_item],
      success_url: request_request_payment_sucessful_url(request_id: @request.id),
      cancel_url: request_request_payment_unsucessful_url(request_id: @request.id),
      metadata: { request_id: @request.id }
    )
    # redirect_to session.url, allow_other_host: true
    RequestPaymentMailer.with(request: @request).send_payment_request(session.url).deliver_now
    redirect_to order_managment_path flash[:notice] = "Payment request sent to user"
    puts session.url
    # pass session.url to action mailer to send to user
  end

  def request_payment_sucessful
    @request = Request.find(params[:request_id])
    @request.update(paid_status: "paid")
    flash[:notice] = "Payment successful! Thank you for your order!"
  end

  def request_payment_unsucessful
    @request = Request.find(params[:request_id])
    @request.update(paid_status: "unpaid")
    flash[:notice] = "Payment unsuccessful! Please try again!"
  end
end
