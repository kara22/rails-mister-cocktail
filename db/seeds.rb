# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ingredient.destroy_all
Cocktail.destroy_all
require 'json'
require 'open-uri'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)

ingredient["drinks"].first(10).each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end



url_cocktail = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic"
cocktail_serialized = open(url_cocktail).read
cocktail = JSON.parse(cocktail_serialized)

cocktail["drinks"].first(10).each do |cocktail|
  Cocktail.create(name: cocktail["strDrink"])
end


