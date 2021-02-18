class CreateTourists < ActiveRecord::Migration[6.1]
  def change
    create_table :tourists do |t|

      t.timestamps
    end
  end
end
