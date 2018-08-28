class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.string :brand_id
      t.string :image
      t.string :type_id
      t.string :size_id
      

      t.timestamps null: false
    end
  end
end
