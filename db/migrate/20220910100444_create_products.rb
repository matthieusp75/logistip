class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :ean
      t.text :title
      t.text :description
      t.integer :quantity_in_stock
      t.integer :buying_price
      t.integer :selling_price
      t.integer :quantity_per_case
      t.integer :minimum_order_quantity
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
