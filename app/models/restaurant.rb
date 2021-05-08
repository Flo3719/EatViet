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
class Restaurant < ApplicationRecord
  has_many :items
  geocoded_by :address
  after_validation :geocode, if: -> (obj){obj.address.present? and obj.address_changed?}

  validates :name, presence: true
  validates :address, presence: true

  validate :validate_address

  def validate_address 
    true
  end
end
