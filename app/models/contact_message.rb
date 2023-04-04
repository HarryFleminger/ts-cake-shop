class ContactMessage < ApplicationRecord
  validates :name, :email, :subject, :message, presence: true
end
