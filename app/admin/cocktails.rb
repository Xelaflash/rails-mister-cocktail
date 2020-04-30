# frozen_string_literal: true

ActiveAdmin.register Cocktail do
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
  permit_params :name, :recipe, :photo
  index do
    selectable_column
    column :id
    column :name
    column :recipe
    column :created_at
    actions
  end
  show do
    attributes_table do
      row :id
      row :name
      row :recipe
      row :photo do |cocktail|
        image_tag url_for(cocktail.photo), width: 150
      end
    end
  end
  form do |f|
    f.inputs 'Cocktail Details' do
      f.input :name
      f.input :recipe
      f.input :photo, as: :file
    end
    f.actions
  end
end
