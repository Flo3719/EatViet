class Item < ApplicationRecord
  belongs_to :restaurant
  validates :name, presence: true, length: {minimum: 5}
  validates :price, presence: true, length: {minimum: 1}
  before_save :calculateDollarPrice

  private 

  def calculateDollarPrice
    self.dollarPrice = ((price/22996.1)>=0.01)? (price/22996.1) : 0.01
  end
end
