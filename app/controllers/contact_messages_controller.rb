class ContactMessagesController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @contact_message = ContactMessage.new
  end

  def create
    @contact_message = ContactMessage.new(contact_message_params)

    if @contact_message.valid?
      ContactMessageMailer.contact_message(@contact_message).deliver_now
      redirect_to root_path, notice: 'Message sent successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_message_params
    params.require(:contact_message).permit(:name, :email, :message, :phone, :subject)
  end
end
