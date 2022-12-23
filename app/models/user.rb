class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :line_items, through: :orders
  has_many :products, through: :line_items
  validates :first_name, :last_name, presence: true
  validates :email, presence: true
end
