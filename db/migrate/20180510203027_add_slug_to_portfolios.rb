class AddSlugToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :slug, :string, unique: true
  end
end
