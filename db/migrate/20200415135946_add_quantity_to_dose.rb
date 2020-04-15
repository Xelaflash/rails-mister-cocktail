# frozen_string_literal: true

class AddQuantityToDose < ActiveRecord::Migration[5.1]
  def change
    add_column :doses, :quantity, :string
  end
end
