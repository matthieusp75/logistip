class ChangeProductsEan < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :ean, :string
  end
end
