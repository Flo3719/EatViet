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
      restaurant = Restaurant.new(address: '88 Thái Phiên, Hoi An, Vietnam').save
      expect(restaurant).to eq(false)
    end
    it 'ensures address is present' do
      restaurant = Restaurant.new(name: 'Phi Bánh Mì').save
      expect(restaurant).to eq(false)
    end
    it 'should succeed' do
      restaurant = Restaurant.new(name: 'Phi Bánh Mì', address: '88 Thái Phiên, Hoi An, Vietnam').save
      expect(restaurant).to eq(true)
    end
  end
end
