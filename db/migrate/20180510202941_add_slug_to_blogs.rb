class AddSlugToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :slug, :string, unique: true
  end
end
