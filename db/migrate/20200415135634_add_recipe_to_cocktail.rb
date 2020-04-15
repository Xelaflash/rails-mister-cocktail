# frozen_string_literal: true

class AddRecipeToCocktail < ActiveRecord::Migration[5.1]
  def change
    add_column :cocktails, :recipe, :text
  end
end
