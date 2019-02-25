class AddImageToArrangements < ActiveRecord::Migration[5.2]
  def change
    add_column :arrangements, :image, :string
  end
end
