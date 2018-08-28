class AddPictureToShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :picture, :string
  end
end
