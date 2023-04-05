class ShopOrderMailer < ApplicationMailer
  def order_confirmation(order)
    @order = order
    @user = @order.user

    mail to: @user.email, subject: "TeeBakes&Cakes Order Confirmation!"
  end
end
