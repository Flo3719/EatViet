class SubscriptionsController < ApplicationController
  #layout "subscribe"
  skip_before_action :verify_authenticity_token
  
  def create
    options = {
      stripe_id: request.parameters[:data][:customer],
      subscribed: true
    }
    current_user.update(options)
  end

    #plan_id = params[:plan_id]

    # payment_intent = Stripe::PaymentIntent.create(
    #   amount: 1000,
    #   currency: 'eur',
    # )
    # {
    #   clientSecret: payment_intent['client_secret'],
    # }.to_json

    # redirect_to home_path, notice: "Your subscription was setup successfully!"
  

  def destroy
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete
    current_user.update(stripe_subscription_id: nil)
    current_user.subscribed = false

    redirect_to home_path, notice: "Your subscription has been cancelled."
  end
end