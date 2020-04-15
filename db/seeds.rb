# frozen_string_literal: true

puts "Deleting all the ingredients, cocktails, users, doses \o/"
Ingredient.destroy_all
Cocktail.destroy_all
User.destroy_all
Dose.destroy_all

puts 'Creating ingredients'
puts '-------------'
Ingredient.create(name: 'Mount Gay Black Barrel')
Ingredient.create(name: 'Fresh Lime Juice')
Ingredient.create(name: 'Orgeat')
Ingredient.create(name: 'Cointreau')
puts 'Seed done'
