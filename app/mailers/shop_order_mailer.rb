class ShopOrderMailer < ApplicationMailer
  def order_confirmation(user, order)
    @order = order
    @user = user
    mail to: @user.email, subject: "TeeBakes&Cakes Order Confirmation!"
  end
end
