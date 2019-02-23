class ChangeQuantityAndFrequencyOnOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :quantity, :integer, default: 1
    change_column :orders, :frequency, :string, default: "Once a week"
  end
end
