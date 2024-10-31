require "httparty"
require "faker"

# Fetch all categories from the API
categories_response = HTTParty.get("https://api.chucknorris.io/jokes/categories")
categories_response.each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

# Fetch and seed jokes for each category
200.times do
  joke_response = HTTParty.get("https://api.chucknorris.io/jokes/random")
  joke = Joke.find_or_create_by!(
    joke_text: joke_response["value"],
    api_id: joke_response["id"],
    icon_url: joke_response["icon_url"],
    url: joke_response["url"],
  )

  # Assign categories from API
  joke_response["categories"].each do |category_name|
    category = Category.find_by(name: category_name)
    joke.categories << category unless joke.categories.include?(category)
  end
end

# Create the "FAKER" category if it doesn't exist
faker_category = Category.find_or_create_by!(name: "FAKER")

# Seed 10 jokes with the "FAKER" category using the Faker gem
10.times do
  joke_text = Faker::ChuckNorris.fact
  joke = Joke.create!(
    joke_text: joke_text,
    api_id: SecureRandom.uuid, # Generate a unique ID for Faker jokes
    icon_url: "https://api.chucknorris.io/img/avatar/chuck-norris.png", # Placeholder icon URL
    url: "https://api.chucknorris.io", # Placeholder URL for Faker jokes
  )
  joke.categories << faker_category unless joke.categories.include?(faker_category)
end
