class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :family_name
      t.string :first_name
      t.string :family_name_kana
      t.string :first_name_kana
      t.string :postcode
      t.text :address
      t.string :phone_number
      t.string :email
      t.string :encrypted_password
      t.integer :user_status

      t.timestamps
    end
  end
end
