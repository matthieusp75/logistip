class OrderLine < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, :line_total_price, presence: true
end
