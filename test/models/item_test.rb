# == Schema Information
#
# Table name: items
#
#  id            :bigint           not null, primary key
#  dollarPrice   :float
#  name          :string
#  price         :float
#  translation   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :integer
#
require "test_helper"

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
