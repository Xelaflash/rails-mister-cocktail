# frozen_string_literal: true

class RemovePictureFromCocktail < ActiveRecord::Migration[5.2]
  def change
    remove_column :cocktails, :picture
  end
end
