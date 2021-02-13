class ItemsController < ApplicationController
  def index
  end
  def create 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @item = @restaurant.items.create(item_params)
    redirect_to restaurant_path(@restaurant)
  end
  def edit
    @item = Item.find(params[:id])
  end
  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @item = @restaurant.items.find(params[:id])
    @item.destroy
    redirect_to restaurant_path(@restaurant)
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :price, :translation)
  end
  
end
