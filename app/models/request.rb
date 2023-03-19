class Request < ApplicationRecord
  belongs_to :delivery_address, optional: true
  belongs_to :flavour, optional: true
  belongs_to :custom_cake
  belongs_to :user
  has_many_attached :photos
  validates :datetime_of_occasion, :design_description, presence: true
end
