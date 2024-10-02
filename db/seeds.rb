# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Bookmark.destroy_all
Recipe.destroy_all

Recipe.create!(
  name: 'Spaghetti Carbonara',
  description: "A true Italian Carbonara recipe, it's ready in about 30 minutes. There is no cream, only eggs, cheese, pancetta, and pepper.",
  image_url: 'pasta.jpeg',
  rating: 8.0
)

Recipe.create!(
  name: 'Chicken Tikka Masala',
  description: 'A popular Indian dish with marinated chicken pieces cooked in a rich, creamy tomato sauce with a variety of spices.',
  image_url: 'tikka.jpeg',
  rating: 9.0
)

Recipe.create!(
  name: 'Margherita Pizza',
  description: 'A classic Italian pizza made with a simple tomato sauce, fresh mozzarella, basil, and olive oil.',
  image_url: 'pizza.jpeg',
  rating: 7.0
)

Recipe.create!(
  name: 'Beef Stroganoff',
  description: 'A Russian dish consisting of sautéed pieces of beef served in a sauce with sour cream.',
  image_url: 'stroganoff.jpeg',
  rating: 8.0
)
