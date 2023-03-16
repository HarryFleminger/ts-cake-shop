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
    @request = Request.new(request_params)
    if @request.save
      redirect_to @request
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  private

  def request_params
    params.require(:request).permit(:name, :email, :phone, :message)
  end
end
