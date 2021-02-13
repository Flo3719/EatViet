class AddRestaurantIdToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :restaurant_id, :integer
  end
end
