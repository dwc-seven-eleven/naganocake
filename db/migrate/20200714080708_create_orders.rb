class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :total_price
      t.integer :pay
      t.integer :status
      t.string :shipping_name
      t.string :shipping_postcode
      t.text :shipping_adress
      t.integer :postage

      t.timestamps
    end
  end
end
