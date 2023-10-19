require 'faker'
# puts "Cleaning the db..."
# Restaurant.destroy_all

# puts 'Creating restaurants...'
# # This is where you can create initial data for your app.
# 20.times do
#   restaurant = Restaurant.new(
#     name: Faker::Restaurant.name,
#     address: Faker::Address.street_address,
#     rating: rand(1..5)
#   )
#   restaurant.save
# end
# puts "... created #{Restaurant.count} restaurants."

require "json"
require "rest-client"

response = RestClient.get("https://swapi.dev/api/people")
results = JSON.parse(response)["results"]
results.each do |result|
  restaurant = Restaurant.new(
    name: result['name'],
    address: Faker::Address.street_address,
    rating: rand(1..5)
  )
  restaurant.save
end
