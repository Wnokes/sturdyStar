class AddPortfolioToGalleryItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :gallery_items, :portfolio, foreign_key: true
  end
end
