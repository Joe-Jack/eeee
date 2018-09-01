class AddLinkToShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :link, :string
  end
end
