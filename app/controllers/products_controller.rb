class ProductsController < ApplicationController

  def index
    @prodcuts = Product.all
  end
end
