# frozen_string_literal: true

ActiveAdmin.register Ingredient do
  permit_params :name, :tag_list
  index do
    selectable_column
    column :id
    column :name
    column :tags
    column :created_at
    actions
  end
  show do
    attributes_table do
      row :id
      row :name
      row :tags
    end
  end
  form do |f|
    f.inputs 'Ingredients Details' do
      f.input :name
      f.input :tag_list, collection: ['Spirit', 'Soft Drinks', 'Modifier', 'Garnish'], prompt: 'Select the category'
    end
    f.actions
  end
end
