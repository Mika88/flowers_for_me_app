class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :arrangement_id
      t.integer :quantity
      t.string :delivery_day
      t.string :frequency

      t.timestamps
    end
  end
end
