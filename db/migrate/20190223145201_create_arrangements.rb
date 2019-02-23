class CreateArrangements < ActiveRecord::Migration[5.2]
  def change
    create_table :arrangements do |t|
      t.string :title
      t.string :description
      t.string :height
      t.integer :price

      t.timestamps
    end
  end
end
