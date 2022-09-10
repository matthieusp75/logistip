class Client < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :first_name, :last_name, :address, :telephone, presence: true
end
