class ShopOrderMailer < ApplicationMailer
  def order_confirmation(user, order, delivery_address)
    @order = order
    @user = user
    @delivery_address = delivery_address
    mail to: @user.email, subject: "TeeBakes&Cakes Order Confirmation!"
  end
end
