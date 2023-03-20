class DesignDetailsController < ApplicationController
  def new
    @design_detail = DesignDetail.new
    @custom_cake = CustomCake.find(params[:custom_cake_id])
    @flavour = Flavour.find(params[:flavour_id])
  end

  def create
    @flavour = Flavour.find(params[:flavour_id])
    @custom_cake = CustomCake.find(params[:custom_cake_id])
    @design_detail = DesignDetail.new(design_detail_params)
    if @design_detail.save && @design_detail.delivery_required
      redirect_to new_custom_cake_flavour_design_detail_delivery_address_path(@custom_cake, @flavour, @design_detail)
    elsif @design_detail.save && @design_detail.delivery_required == false
      @request = Request.create!(flavour: @flavour, custom_cake: @custom_cake, design_detail: @design_detail, user: current_user)
      redirect_to request_path(@request)
    else
      @design_detail.photos = params[:design_detail][:photos]
      render :new, status: :unprocessable_entity
    end
  end

  private

  def flavour_params
    params.require(:flavour).permit(:name, :description)
  end

  def design_detail_params
    params.require(:design_detail).permit(:delivery_required, :datetime_of_occasion, :design_description, :phone_number, photos: [])
  end
end
