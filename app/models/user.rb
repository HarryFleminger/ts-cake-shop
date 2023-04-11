class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :orders, dependent: :destroy
  has_many :line_items, through: :orders, dependent: :destroy, foreign_key: :order_id
  has_many :products, through: :line_items
  has_many :requests, dependent: :destroy
  has_many :delivery_addresses, dependent: :destroy
  validates :first_name, :last_name, presence: true
  validates :email, presence: true
end
