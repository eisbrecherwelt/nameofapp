class UserMailer < ApplicationMailer
  default from: "app84945195@heroku.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: 'app84945195@heroku.com',
         to: 'eisbrecherwelt@gmail.com',
         subject: "A new contact form message from #{name}")
  end
  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end