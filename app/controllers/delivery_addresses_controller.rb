class DeliveryAddressesController < ApplicationController
  def new
    @delivery_address = DeliveryAddress.new
    @design_detail = DesignDetail.find(params[:design_detail_id])
    @custom_cake = CustomCake.find(params[:custom_cake_id])
    @flavour = Flavour.find(params[:flavour_id])
  end

  def create
    @flavour = Flavour.find(params[:flavour_id])
    @custom_cake = CustomCake.find(params[:custom_cake_id])
    @design_detail = DesignDetail.find(params[:design_detail_id])
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    @delivery_address.user = current_user

    if @delivery_address.valid?
      @delivery_address.save!
      @request = Request.create!(flavour: @flavour, custom_cake: @custom_cake, design_detail: @design_detail, user: current_user, delivery_address: @delivery_address)
      redirect_to request_path(@request)
    else

      render :new, status: :unprocessable_entity
    end
  end

  def show
    @delivery_address = DeliveryAddress.find(params[:id])
  end

  private

  def delivery_address_params
    params.require(:delivery_address).permit(:street, :city, :postcode)
  end

end
