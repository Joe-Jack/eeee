class AddPicToShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :pic, :string
  end
end
