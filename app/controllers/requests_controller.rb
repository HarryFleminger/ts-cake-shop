class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
    @delivery_address = DeliveryAddress.new
    @flavour = Flavour.new
    @custom_cake = CustomCake.find(params[:custom_cake_id])
  end

  def create
    @request = Request.find(request_id_params[:request_id])
    if @request.update(request_params)
      redirect_to new_custom_cake_request_path(request_id: @request.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  private

  def request_params
    params.require(:request).permit(:delivery_required, :datetime_of_occasion, :design_description, :phone, :message, photos: [])
  end
  def request_id_params
    params.require(:request).permit(:request_id)
  end
end
