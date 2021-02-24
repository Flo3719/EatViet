class CheckoutsController < ApplicationController
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
end
