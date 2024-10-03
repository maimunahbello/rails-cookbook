# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'open-uri'
require 'json'

Bookmark.destroy_all
Recipe.destroy_all

categories = %w[Breakfast Pasta Seafood Dessert]

def recipe_builder(id)
  url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{id}"

  meal_serialised = URI.parse(url).read
  meal = JSON.parse(meal_serialised)['meals'][0]

  Recipe.create!(
    name: meal['strMeal'],
    description: meal['strInstructions'],
    image_url: meal['strMealThumb'],
    rating: rand(1..5.0).round(1)
  )
end

categories.each do |category|
  url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"
  recipes_serialised = URI.parse(url).read
  recipes = JSON.parse(recipes_serialised)
  recipes['meals'].each do |recipe|
    recipe_builder(recipe['idMeal'])
  end
end

# Extract the list of meals
#   meals = recipes['meals']

#   # Print meal information and create a Recipe record if it doesn't already exist
#   puts "Category: #{category}"
#   meals.each do |meal|
#     meal_id = meal['idMeal']
#     meal_name = meal['strMeal']
#     meal_image = meal['strMealThumb']

#     # Check if the recipe already exists, find or create
#     Recipe.find_or_create_by!(name: meal_name) do |recipe|
#       recipe.description = "A delicious #{category} dish."
#       recipe.image_url = meal_image
#       recipe.rating = rand(5.0..10.0).to_i # Assign a random rating for the sake of this example
#     end
#     puts "Processed Meal ID: #{meal_id} (#{meal_name})"
#   end
# end

# Recipe.create!(
#   name: 'Spaghetti Carbonara',
#   description: "A true Italian Carbonara recipe, it's ready in about 30 minutes. There is no cream, only eggs, cheese, pancetta, and pepper.",
#   image_url: 'pasta.jpeg',
#   rating: 8.0
# )

# Recipe.create!(
#   name: 'Chicken Tikka Masala',
#   description: 'A popular Indian dish with marinated chicken pieces cooked in a rich, creamy tomato sauce with a variety of spices.',
#   image_url: 'tikka.jpeg',
#   rating: 9.0
# )

# Recipe.create!(
#   name: 'Margherita Pizza',
#   description: 'A classic Italian pizza made with a simple tomato sauce, fresh mozzarella, basil, and olive oil.',
#   image_url: 'pizza.jpeg',
#   rating: 7.0
# )

# Recipe.create!(
#   name: 'Beef Stroganoff',
#   description: 'A Russian dish consisting of sautéed pieces of beef served in a sauce with sour cream.',
#   image_url: 'stroganoff.jpeg',
#   rating: 8.0
# )
