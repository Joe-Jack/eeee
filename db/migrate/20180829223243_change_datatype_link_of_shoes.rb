class ChangeDatatypeLinkOfShoes < ActiveRecord::Migration
  def change
    change_column :shoes, :link, :text

  end
end
