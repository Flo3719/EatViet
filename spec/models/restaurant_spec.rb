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
require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  context 'validation tests' do
    it 'ensures name is present' do
      restaurant = Restaurant.new()
    end
    it 'ensures address is valid' do
      
    end
    it 'should succeed' do
      
    end
  end
end
