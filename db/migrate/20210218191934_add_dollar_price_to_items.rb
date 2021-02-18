class AddDollarPriceToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :dollarPrice, :float
  end
end
