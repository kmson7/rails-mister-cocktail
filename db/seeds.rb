require 'open-uri'
require 'json'
require 'faker'

# destroy cocktails and ingredients first

puts "cleaning db..."
Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

puts "db cleaned!"

puts 'seeding...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_raw = open(url).read
ingredients_arr = JSON.parse(ingredients_raw)['drinks']

ingredients = []

ingredients_arr.each do |ingredients_hash|
  ingredients << ingredients_hash['strIngredient1']
end

50.times do
  ingredient = Ingredient.create(name: ingredients.sample)
  cocktail = Cocktail.create(name: Faker::Beer.name)
  puts "added #{ingredient}"
end

puts ' '

puts 'seeding done!'
