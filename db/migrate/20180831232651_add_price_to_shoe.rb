class AddPriceToShoe < ActiveRecord::Migration
  def change
    add_column :shoes, :price, :decimal
  end
end
