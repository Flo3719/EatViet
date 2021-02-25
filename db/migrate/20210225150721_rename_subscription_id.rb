class RenameSubscriptionId < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :stripe_subscription_id, :checkout_session_id
  end
end
