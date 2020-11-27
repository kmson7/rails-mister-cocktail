require 'open-uri'
require 'json'
require 'faker'

# destroy cocktails and ingredients first


url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_raw = open(url).read
ingredients_arr = JSON.parse(ingredients_raw)['drinks']

ingredients = []

ingredients_arr.each do |ingredients_hash|
  ingredients << ingredients_hash['strIngredient1']
end

10.times do
  ingredient = Ingredient.create(name: ingredients.sample)
  cocktail = Cocktail.create(name: Faker::Beer.name)
  dose = Dose.new(description: Faker::Food.measurement)

  dose.cocktail = cocktail
  dose.ingredient = ingredient
  dose.save
  puts 'added'
end

puts ' '
puts 'done!'
