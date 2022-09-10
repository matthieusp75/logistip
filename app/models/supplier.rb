class Supplier < ApplicationRecord
  belongs_to :user

  has_many :products

  validates :name, :address, :email, :telephone, :shipping_date_minimum_period, presence: true
end
