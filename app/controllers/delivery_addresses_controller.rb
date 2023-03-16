class DeliveryAddressesController < ApplicationController
  def new
    @delivery_address = DeliveryAddress.new
    @custom_cake = CustomCake.find(params[:custom_cake_id])
  end

  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    if @delivery_address.save
      redirect_to @delivery_address
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @delivery_address = DeliveryAddress.find(params[:id])
  end

  private

  def delivery_address_params
    params.require(:delivery_address).permit( :street, :city, :postal_code, :phone)
  end
end
