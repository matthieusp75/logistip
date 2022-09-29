class OrderLine < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_one :supplier, through: :product

  validates :quantity, :line_total_price, presence: true
  validate :minimum_order

  private

  def minimum_order
    errors.add(:quantity, "La quantité ne peut être inférieure au minimum de commande") if quantity < product.minimum_order_quantity
  end
end
