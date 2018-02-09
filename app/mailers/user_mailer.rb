class UserMailer < ApplicationMailer
  default from: "app84945195@heroku.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'eisbrecherwelt@gmail.com',
         subject: "A new contact form message from #{name}")
  end
end