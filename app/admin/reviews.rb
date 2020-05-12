# frozen_string_literal: true

ActiveAdmin.register Review do
  menu label: 'Reviews'
  permit_params :rating, :cocktail_id
end
