class CreateOderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :oder_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :unit_price
      t.integer :production_item
      t.integer :production_status

      t.timestamps
    end
  end
end
