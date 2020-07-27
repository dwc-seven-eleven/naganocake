class RemoveFullFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :full, :integer
  end
end
