class CreatePhotoProducts < ActiveRecord::Migration
  def change
    create_table :photo_products do |t|
      t.string :title
      t.string :comment

      # カラム追加
      t.string :image
      t.binary :upload_file

      t.timestamps null: false
    end
  end
end
