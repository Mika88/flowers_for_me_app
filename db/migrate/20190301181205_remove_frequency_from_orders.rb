class RemoveFrequencyFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :frequency
  end
end
