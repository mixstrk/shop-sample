class CreateOrder < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.integer :total_products_count, null: false, default: 0
      t.integer :total_price, null: false, default: 0

      t.timestamps
    end
    
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity, null: false
      t.string :price, null: false

      t.timestamps
    end
  end
end
