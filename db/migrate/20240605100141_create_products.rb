class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.string :price, null: false
      t.string :rest, default: 0, null: false
      t.boolean :in_cart, default: false

      t.timestamps
    end
  end
end
