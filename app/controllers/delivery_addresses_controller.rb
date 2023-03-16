class DeliveryAddressesController < ApplicationController
  def new
    @delivery_address = DeliveryAddress.new
    @custom_cake = CustomCake.find(params[:custom_cake_id])
  end

  def create
    @request = Request.find(request_id_params[:request_id])
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    @delivery_address.user = current_user
    if @request.update(delivery_address: @delivery_address)
      redirect_to custom_cake_request_path(@request)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @delivery_address = DeliveryAddress.find(params[:id])
  end

  private

  def delivery_address_params
    params.require(:delivery_address).permit( :street, :city, :postcode, :phone_number)
  end

  def request_id_params
    params.require(:delivery_address).permit(:request_id)
  end
end
