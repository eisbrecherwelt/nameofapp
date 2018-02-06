class SimplePagesController < ApplicationController
  def index
  @products = Product.limit(3)
  render layout: "products"
  end
  def landing_page
    @products = Product.limit(3)
  end
  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(from: @email,
    to: 'eisbrecherwelt@gmail.com',
    subject: "A new contact form message from #{@name}",
    body: @message).deliver_now
  end
end
