class DesignDetail < ApplicationRecord
  has_one :request
  validates :design_description, :datetime_of_occasion, :phone_number, presence: true
  has_many_attached :photos
end
