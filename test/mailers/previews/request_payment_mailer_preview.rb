# Preview all emails at http://localhost:3000/rails/mailers/request_payment_mailer
class RequestPaymentMailerPreview < ActionMailer::Preview

  def send_payment_request

    RequestPaymentMailer.with(request: Request.first).send_payment_request("https://checkout.stripe.com/c/pay/cs_test_a1gnGl6DVV1BGWPadEiGT04dQVT4TlftNmWjqvuKzillaJWs64QKNdV5F4#fidkdWxOYHwnPyd1blpxYHZxWjA0SEJ0R01EbENwfVFRako3dn1tQU1Ob0k0f1BVSzR8QlJCaVRCQ2J8aUZsUWs8V0ZjRmxJU0ZWQGRtUjRoS3RDaFdmbVdoTEp2Zm9Xf2liQmsyS0YyYGdRNTVdNDJrMWRRYycpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPyd2bGtiaWBabHFgaCcpJ2BrZGdpYFVpZGZgbWppYWB3dic%2FcXdwYHgl")
  end

end
