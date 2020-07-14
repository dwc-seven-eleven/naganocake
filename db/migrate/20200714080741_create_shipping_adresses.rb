class CreateShippingAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_adresses do |t|
      t.integer :user_id
      t.string :shipping_name
      t.string :shipping_postcode
      t.text :shipping_address

      t.timestamps
    end
  end
end
