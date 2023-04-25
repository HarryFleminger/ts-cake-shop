# Preview all emails at http://localhost:3000/rails/mailers/shop_order_mailer
class ShopOrderMailerPreview < ActionMailer::Preview
  def order_confirmation
    user = User.first
    order = Order.find(5)
    ShopOrderMailer.order_confirmation(user, order)
  end
end
