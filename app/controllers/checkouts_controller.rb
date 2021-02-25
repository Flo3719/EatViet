class CheckoutsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  skip_before_action :verify_authenticity_token

  def new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    if user_signed_in? && (current_user.subscribed? or current_user.type == "Translator") 
      redirect_to restaurants_path
    end
  end

  def create
    Stripe.api_key = Rails.application.credentials.stripe_api_key
    price_id = "price_1IMxXDBmXNf1hQuxQtstKyH7"
    price = Stripe::Price.retrieve(price_id)

    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price: price_id,
        quantity: 1,
      }],
      mode: 'subscription',
      success_url: payment_success_url,
      cancel_url: payment_failure_url,
    })
    message = {:id => session.id }
    current_user.update(checkout_session_id: session.id)

    render :json => message
  end
end
