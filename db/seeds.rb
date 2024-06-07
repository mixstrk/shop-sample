# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

products = [
  { title: "Iphone 200", price: 12000, rest: 10 },
  { title: "Samsung S200", price: 22000, rest: 5 },
  { title: "Poco X6", price: 2000, rest: 15 },
  { title: "One Plus", price: 10000, rest: 2 },
  { title: "Honor 2", price: 1000, rest: 15 },
  { title: "Iphone 201", price: 22000, rest: 10 },
  { title: "Samsung S201", price: 32000, rest: 5 },
  { title: "Poco X7", price: 3000, rest: 15 },
  { title: "One Plus 2", price: 20000, rest: 2 },
  { title: "Honor 3", price: 2000, rest: 15 },
  { title: "Iphone 202", price: 32000, rest: 10 },
  { title: "Samsung S202", price: 42000, rest: 5 },
  { title: "Poco X8", price: 4000, rest: 15 },
  { title: "One Plus 3", price: 30000, rest: 2 },
  { title: "Honor 4", price: 3000, rest: 15 },
  { title: "Iphone 203", price: 42000, rest: 10 },
  { title: "Samsung S203", price: 52000, rest: 5 },
  { title: "Poco X9", price: 5000, rest: 15 },
  { title: "One Plus 4", price: 40000, rest: 4 },
  { title: "Honor 5", price: 4000, rest: 15 },
]

products.each do |product|
  Product.create!(product)
end
