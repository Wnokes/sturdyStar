class AddMainImageToPortfolio < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :main_image, :string
  end
end
