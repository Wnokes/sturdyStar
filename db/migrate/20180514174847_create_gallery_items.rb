class CreateGalleryItems < ActiveRecord::Migration[5.1]
  def change
    create_table :gallery_items do |t|
      t.string :title
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
