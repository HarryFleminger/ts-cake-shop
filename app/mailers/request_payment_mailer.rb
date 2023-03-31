class RequestPaymentMailer < ApplicationMailer

  def send_payment_request(stripe_url)
    @request = params[:request]
    @user = @request.user
    @stripe_url = stripe_url
    mail(
      to: @user.email,
      subject: "TeeBakes&Cakes has accepted your #{@request.custom_cake.name} request!"
    )
  end

  def send_email
    mail(to: 'henry.fleminger@gmail.com', subject: 'Well done for succesfully sending an email! to yourself :D')
  end
end
