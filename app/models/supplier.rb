class Supplier < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  has_many :products
  has_many :order_lines, through: :products
  has_many :orders, through: :order_lines

  validates :name, :address, :email, :telephone, :shipping_date_minimum_period, presence: true
end
