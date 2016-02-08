class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.string :product_title
      t.string :product_number
      t.integer :product_price
      t.integer :product_quantity

      t.timestamps null: false
    end
  end
end
