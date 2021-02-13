class AddTranslationToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :translation, :string
  end
end
