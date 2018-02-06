# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Initialize SendGrid for emails
ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: '587',
  authentication: :plain,
  user_name: ENV['app84945195@heroku.com'],
  password: ENV['H@lofan22'],
  domain: 'heroku.com',
  enable_starttls_auto: true
}