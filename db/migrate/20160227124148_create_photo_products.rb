class CreatePhotoProducts < ActiveRecord::Migration
  def change
    create_table :photo_products do |t|
      t.string :name
      t.integer :price

      t.timestamps null: false
    end
  end
end
