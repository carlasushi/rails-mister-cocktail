# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks_serialized = open(url).read
drinks = JSON.parse(drinks_serialized)["drinks"]
drinks.each_with_index do |drink, index|
  puts "creating ingredient number #{index + 1}"
  Ingredient.create!(name: drink["strIngredient1"])
end


puts "creating 1 cocktail"
url = "https://images.unsplash.com/photo-1522128307404-b88f4f817e68?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1576&q=80"
cocktail = Cocktail.new(name: "Miami Watermelon")
cocktail.remote_photo_url = url
cocktail.save!
puts "done"
