class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :stock_count, numericality: { greater_than_or_equal_to: 0 }
  validates :in_stock, inclusion: { in: [true, false] }
  has_many :line_items
  has_many :orders, through: :line_items
  has_many_attached :photos
  monetize :price_cents
  accepts_nested_attributes_for :line_items
  # validates_associated :photos
  validates :photos, attached: true
end
