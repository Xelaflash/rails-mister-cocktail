# frozen_string_literal: true

json.extract! @cocktail, :id, :name, :recipe, :slug, :photo
json.doses @cocktail.doses do |dose|
  json.extract! dose, :id, :description, :ingredient
end
json.reviews @cocktail.reviews do |review|
  json.extract! review, :id, :rating
end
