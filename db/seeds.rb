require 'json'
require 'open-uri'

puts "Deleting all the ingredients \o/"
Ingredient.destroy_all
url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
list = JSON.parse(user_serialized)

list["drinks"].each do |drink|
  Ingredient.create!(name: drink["strIngredient1"])
end
puts "the end ingredients"
