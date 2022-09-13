class OrderLine < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_one :supplier, through: :product

  validates :quantity, :line_total_price, presence: true
end
