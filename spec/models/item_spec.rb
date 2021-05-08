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
  context 'test validation' do
    let(:restaurant) { create(:restaurant) }

    it 'ensures name is present' do
      item = Item.new(price: '100000', translation: 'Sandwich', restaurant: restaurant).save
      expect(item).to eq(false)
    end
    it 'ensures item belongs to restaurant' do
      item = Item.new(price: '100000', translation: 'Sandwich').save
      expect(item).to eq(false)
    end
    it 'should validate' do
      item = Item.new(name: 'Banh Mi', price: '100000', translation: 'Sandwich', restaurant: restaurant).save
      expect(item).to eq(true)
    end
  end
end
