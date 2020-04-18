# frozen_string_literal: true

ActiveAdmin.register Ingredient do
  permit_params :name
  index do
    selectable_column
    column :id
    column :name
    column :created_at
    actions
  end
end
