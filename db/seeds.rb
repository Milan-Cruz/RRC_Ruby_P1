require "httparty"

# Fetch all categories
categories_response = HTTParty.get("https://api.chucknorris.io/jokes/categories")
categories_response.each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

# Fetch and seed jokes for each category
20.times do
  joke_response = HTTParty.get("https://api.chucknorris.io/jokes/random")
  joke = Joke.find_or_create_by!(
    joke_text: joke_response["value"],
    api_id: joke_response["id"],
    icon_url: joke_response["icon_url"],
    url: joke_response["url"],
  )

  # Assign categories
  joke_response["categories"].each do |category_name|
    category = Category.find_by(name: category_name)
    joke.categories << category unless joke.categories.include?(category)
  end
end

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
