class RestaurantsController < ApplicationController
  def index
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

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end
end
