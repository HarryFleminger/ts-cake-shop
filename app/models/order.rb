class Order < ApplicationRecord
  belongs_to :user
  belongs_to :delivery_address, optional: true
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items
  accepts_nested_attributes_for :line_items
end
