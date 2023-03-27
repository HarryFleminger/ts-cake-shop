class RequestStatusController < ApplicationController

  def request_status
    @request = Request.find(params[:request_id])
    status = params[:status]
    if status == "completed"
      @request.update(status: "Completed")
      redirect_to request_path(@request)
      flash[:notice] = "Request set to: Completed"
    elsif status == "in progress"
      @request.update(status: "In progress")
      redirect_to request_path(@request)
      flash[:notice] = "Request set to: In progress"
    else
      redirect_to request_path(@request)
      flash[:notice] = "Nothing happend"
    end
  end

end
