class SubscriptionsController < ApplicationController
  #layout "subscribe"
  skip_before_action :verify_authenticity_token
  
  def create
    event = Stripe::Event.retrieve(params[:id])
    options = {
      stripe_id: event[:data][:object][:customer],
      subscribed: true
    }
    user = User.find_by(checkout_session_id: request.parameters[:data][:object][:id])
    user.update(options)
  end  

  def destroy
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete
    current_user.update(stripe_subscription_id: nil)
    current_user.subscribed = false

    redirect_to home_path, notice: "Your subscription has been cancelled."
  end
end