class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :check_admin, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @line_item = LineItem.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def add_to_basket
    current_order = current_user.orders.where(state: 'pending').first
    current_product = Product.find(product_params[:id])

    line_item_params = product_params[:line_items_attributes]
    product_quantity = line_item_params["0"][:quantity]
    if current_order.products.where(name: "#{current_product.name}").present?
      new_line_item = LineItem.joins(:product).where("products.name = ?", "#{current_product.name}").first
      new_line_item.quantity = product_quantity.to_i
      new_line_item.save
    else
      new_line_item = LineItem.create(quantity: product_quantity)
      new_line_item.order = current_order
      new_line_item.product = current_product
      new_line_item.save
    end
  end

  private

  def product_params
    params.require(:product).permit(:body, :name, :description, :price_cents, :id, line_items_attributes: [:quantity], photos: [])
  end

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
