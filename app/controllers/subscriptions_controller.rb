class SubscriptionsController < ApplicationController
  #layout "subscribe"
  before_action :authenticate_user!, except: [:new, :create]
  skip_before_action :verify_authenticity_token


  def new
    if user_signed_in? && current_user.subscribed?
      redirect_to home_path, notice: "You are already a subscriber"
    end
  end

  def create
    Stripe.api_key = Rails.application.credentials.stripe_api_key
    price_id = "price_1IMxXDBmXNf1hQuxQtstKyH7"
    price = Stripe::Price.retrieve(price_id)
    token = params[:stripeToken]

    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price: price_id,
        quantity: 1,
      }],
      mode: 'subscription',
      # These placeholder URLs will be replaced in a following step.
      success_url: payment_success_url,
      cancel_url: payment_failure_url,
    })
    message = {:id => session.id }
    render :json => message
  end  

    #plan_id = params[:plan_id]
   
    
    # customer = if current_user.stripe_id?
    #             Stripe::Customer.retrieve({
    #               id: current_user.stripe_id,
    #               expand: ['subscriptions']
    #             })
    #            else
    #             Stripe::Customer.create({
    #               email: current_user.email, 
    #               source: token,
    #               expand: ['subscriptions']
    #             })
    #           end

    # payment_intent = Stripe::PaymentIntent.create(
    #   amount: 1000,
    #   currency: 'eur',
    # )
    # {
    #   clientSecret: payment_intent['client_secret'],
    # }.to_json

    #subscription = customer.subscriptions.create(items: [{price: price.id}])

    # options = {
    #   stripe_id: customer.id,
    #   #stripe_subscription_id: subscription.id,
    #   subscribed: true
    # }

    # options.merge!(
    #   card_last4: params[:user][:card_last4],
    #   card_exp_month: params[:user][:card_exp_month],
    #   card_exp_year: params[:user][:card_exp_year],
    #   card_type: params[:user][:card_type]
    # ) if params[:user]&[:card_last4]

    #current_user.update(options)

    

    # redirect_to home_path, notice: "Your subscription was setup successfully!"
  

  def destroy
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete
    current_user.update(stripe_subscription_id: nil)
    current_user.subscribed = false

    redirect_to home_path, notice: "Your subscription has been cancelled."
  end
end