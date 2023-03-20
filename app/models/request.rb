class Request < ApplicationRecord
  belongs_to :delivery_address, optional: true
  belongs_to :flavour
  belongs_to :custom_cake
  belongs_to :user
  belongs_to :design_detail
end
