class CreateSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :telephone
      t.integer :shipping_date_minimum_period
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
