# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :nickname, :email, :admin
  index do
    selectable_column
    column :id
    column :email
    column :nickname
    column :admin
    column :created_at
    actions
  end
  form do |f|
    f.inputs 'Identity' do
      f.input :nickname
      f.input :email
    end
    f.inputs 'Admin' do
      f.input :admin
    end
    f.actions
  end
end
