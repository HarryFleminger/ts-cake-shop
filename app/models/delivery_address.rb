class DeliveryAddress < ApplicationRecord
  has_one :request
  belongs_to :user
end
