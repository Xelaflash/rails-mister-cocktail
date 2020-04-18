# frozen_string_literal: true

ActiveAdmin.register Cocktail do
  permit_params :name, :recipe, :photo
  index do
    selectable_column
    column :id
    column :name
    column :recipe
    column :created_at
    actions
  end
end
