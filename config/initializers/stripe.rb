Rails.configuration.stripe = {
  :publishable_key => 'sk_test_WtaO2Dk4RGZHiUyJIhlBKeX1',
  :secret_key      => 'pk_test_TMd0SM8LxpvqJNNkLsc0gySh'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

