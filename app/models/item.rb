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
class Item < ApplicationRecord
  belongs_to :restaurant
  validates :name, presence: true, length: {minimum: 5}
  validates :price, presence: true, length: {minimum: 1}
  before_save :calculateDollarPrice

  broadcasts

  private 

  def calculateDollarPrice
    self.dollarPrice = ((price/22996.1)>=0.01)? (price/22996.1) : 0.01
  end
end
