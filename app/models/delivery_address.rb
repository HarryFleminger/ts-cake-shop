class DeliveryAddress < ApplicationRecord
  has_one :request
  has_one :order
  belongs_to :user
  validates :street, :city, :postcode, presence: true
end
