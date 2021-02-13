class ItemsController < ApplicationController
  def index
  end
  def create 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @item = @restaurant.items.create(item_params)
    redirect_to restaurant_path(@restaurant)
  end
  def item_params
    params.require(:item).permit(:name, :price)
  end
end
