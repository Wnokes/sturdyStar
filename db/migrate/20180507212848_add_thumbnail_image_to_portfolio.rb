class AddThumbnailImageToPortfolio < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :thumbnail_image, :string
  end
end
