class CreateOrderLines < ActiveRecord::Migration[6.1]
  def change
    create_table :order_lines do |t|
      t.integer :quantity
      t.integer :line_total_price
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
