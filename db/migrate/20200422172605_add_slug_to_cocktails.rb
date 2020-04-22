class AddSlugToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :slug, :string
    add_index :cocktails, :slug, unique: true
  end
end
