# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  card_exp_month         :integer
#  card_exp_year          :integer
#  card_last4             :string
#  card_type              :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  subscribed             :boolean
#  type                   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  checkout_session_id    :string
#  stripe_id              :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
