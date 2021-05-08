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
require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
