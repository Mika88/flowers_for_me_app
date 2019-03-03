class RemoveActiveFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :active
  end
end
