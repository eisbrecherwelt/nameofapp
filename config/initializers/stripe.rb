if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_bpXPGoq08K5ajO8pGxWWH4cH',
    secret_key: 'sk_test_IjHIImaAoPJar7G1kqzf9zPG'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]