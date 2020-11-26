require 'open-uri'
require 'json'
require 'faker'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_raw = open(url).read
ingredients_arr = JSON.parse(ingredients_raw)['drinks']

ingredients = []

ingredients_arr.each do |ingredients_hash|
  ingredients << ingredients_hash['strIngredient1']
end


10.times do
# ingredients.each do |ingredient|
  # ingredient = Ingredient.create(name: ingredient)
  ingredient = Ingredient.create(name: ingredients.sample)
  cocktail = Cocktail.create(name: Faker::Beer.name)

  dose = Dose.new(description: Faker::Food.measurement, cocktail: cocktail, ingredient: ingredient)
# instance?
  dose.save
  puts 'added'
end

puts ' '
puts 'done!'


