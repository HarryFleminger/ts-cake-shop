class FlavoursController < ApplicationController
  def index
    @flavours = Flavour.all
  end

  def new
    @flavour = Flavour.new
    @custom_cake = CustomCake.find(params[:custom_cake_id])
  end

  def create
    @flavour = Flavour.create!(flavour_params)
    @custom_cake = CustomCake.find(params[:custom_cake_id])
    request = Request.create!(user: current_user, custom_cake: @custom_cake, flavour: @flavour)
    if request.save
      redirect_to new_custom_cake_request_path
    else
      render :new
    end
  end

  def show
    @flavour = Flavour.find(params[:id])
  end

  private

  def flavour_params
    params.require(:flavour).permit(:flavour)
  end
end
