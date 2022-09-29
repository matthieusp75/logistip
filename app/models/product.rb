class Product < ApplicationRecord
  belongs_to :supplier
  has_one_attached :photo

  has_many :order_lines

  validates :ean, :title, :description, :quantity_in_stock, :buying_price, :selling_price, presence: true
  validates :quantity_per_case, :minimum_order_quantity, presence: true
end
