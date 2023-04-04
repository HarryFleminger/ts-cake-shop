class RequestConfirmationMailer < ApplicationMailer
  def confirm_request(request)
    @request = request
    @user = @request.user
    mail(to: @user.email, subject: "#{@request.custom_cake.name} Confirmation")
  end
end
