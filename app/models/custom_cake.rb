class CustomCake < ApplicationRecord
  has_many :requests
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  monetize :price_cents
  has_one_attached :photo
end
