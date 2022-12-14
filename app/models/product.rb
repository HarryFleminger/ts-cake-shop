class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  has_many :line_items
  has_many :orders, through: :line_items
  has_one_attached :photo
  monetize :price_cents
end
