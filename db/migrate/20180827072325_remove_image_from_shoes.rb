class RemoveImageFromShoes < ActiveRecord::Migration
  def change
    remove_column :shoes, :image, :string
  end
end
