class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @products = Product.all
  end

  def order_managment
    @requests = current_user.requests
  end

  def order_managment_shop
    @orders = current_user.orders
  end
end
