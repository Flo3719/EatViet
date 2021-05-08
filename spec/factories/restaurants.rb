# == Schema Information
#
# Table name: restaurants
#
#  id         :bigint           not null, primary key
#  address    :text
#  latitude   :float
#  longitude  :float
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :restaurant do
    
  end
end
