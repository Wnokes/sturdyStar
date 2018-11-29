class AddSubtitleToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :subtitle, :string
  end
end
