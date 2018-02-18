class RemoveIdDrinkToCocktails < ActiveRecord::Migration[5.1]
  def change
    remove_column :cocktails, :iddrink, :string
  end
end
