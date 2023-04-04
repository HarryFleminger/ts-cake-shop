class RequestsController < ApplicationController
  after_action :send_request_email

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
    session[:form_data] ||= {}
    @request = Request.find(request_id_params[:request_id])
    if request_params[:datetime_of_occasion].blank? || request_params[:design_description].blank?
      flash[:notice] = "Please enter a date and time for your occasion and a description of your design"
      session[:form_data] = params[:form_data]
      redirect_back(fallback_location: new_custom_cake_request_path(request_id: @request.id, form_data: session[:form_data]))
    else
      @request.update(request_params)
      redirect_to new_custom_cake_request_path(request_id: @request.id)
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  def send_request_email
    RequestConfirmationMailer.confirm_request(@request).deliver_now
  end

  private

  def request_params
    params.require(:request)
  end
  def request_id_params
    params.require(:request).permit(:request_id)
  end
end
