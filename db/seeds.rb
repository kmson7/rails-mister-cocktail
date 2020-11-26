# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks_raw = open(url).read
drinks_arr = JSON.parse(drinks_raw)['drinks']

drinks = []

drinks_arr.each do |drink_hash|
  drinks << drink_hash['strIngredient1']
end

10.times do
  Cocktail.create(name: drinks.sample)
  puts 'added a cocktail'
end
