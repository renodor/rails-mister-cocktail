require 'json'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Clean Ingredient Table'
Ingredient.destroy_all

puts 'Create Ingredients'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
serialized_url = open(url).read
ingredients = JSON.parse(serialized_url)

ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

puts 'Done!'
puts ">>>> #{Ingredient.count} ingredients created"
puts "-------------------------------------------"

puts 'Clean Cocktail Table'
Cocktail.destroy_all

puts 'Create Cocktails'
Cocktail.create!(name: 'Cocktail du Démon')
Cocktail.create!(name: 'Cocktail de Ouf')

puts 'Done'
puts ">>>> #{Cocktail.count} ingredients created"
puts "-------------------------------------------"

puts 'Clean Doses Table'
Dose.destroy_all

puts 'Create Doses'
Dose.create!(description: '5litres', cocktail_id: 1, ingredient_id: 50)
puts 'Done!'
puts ">>>> #{Dose.count} dose created"
