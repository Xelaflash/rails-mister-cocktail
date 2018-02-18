class AddIdDrinkToCocktails < ActiveRecord::Migration[5.1]
  def change
    add_column :cocktails, :iddrink, :string
  end
end
