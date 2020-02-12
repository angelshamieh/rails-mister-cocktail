# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database'

Ingredient.destroy_all

puts 'fetching new ingredients'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = HTTParty.get(url)
data = response.parsed_response
list_of_ingredients = data['drinks']
list_of_ingredients.each do |ingredient|
  new_ingredient = Ingredient.new(name: ingredient['strIngredient1'])
  new_ingredient.save!
end

puts 'Finished!'
puts "You have now #{Ingredient.count} ingredients"
