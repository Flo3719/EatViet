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
FactoryBot.define do
  factory :item do
    
  end
end
