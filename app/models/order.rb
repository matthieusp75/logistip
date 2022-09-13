class Order < ApplicationRecord
  belongs_to :user
  belongs_to :client

  has_many :order_lines

  validates :planned_delivery_date, :total_price, :status, presence: true
end
