class Order < ApplicationRecord
  belongs_to :user
  belongs_to :client, optional: true
end
