class RemovePictureFromShoes < ActiveRecord::Migration
  def change
    remove_column :shoes, :picture, :string
  end
end
