class DeliveryAddress < ApplicationRecord
  has_one :request
  belongs_to :user
  validates :street, :city, :postcode, presence: true
end
