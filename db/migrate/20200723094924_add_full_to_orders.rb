class AddFullToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :full, :integer
  end
end
