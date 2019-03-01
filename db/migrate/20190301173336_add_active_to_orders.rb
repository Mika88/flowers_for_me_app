class AddActiveToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :active, :boolean, :default => false
  end
end
