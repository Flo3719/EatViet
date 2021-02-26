class RestaurantsController < ApplicationController
  before_action :require_subscription

  def index
    if Rails.env.production?
      @user_location = request.location.address
    end
    @restaurants = Restaurant.order('created_at DESC')    
  end

  def new 
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "Restaurant added!"
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end  

  private

  def require_subscription
      unless user_signed_in? && current_user.subscribed?
        flash[:error] = "You must subscribe to access this section"
        redirect_to new_checkout_path
      end
  end
end
