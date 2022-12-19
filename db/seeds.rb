# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Product.create(name: "Cheese Cake", price_cents: 15, description: "Cheesy goodnes")
Product.create(name: "Spunge Cake", price_cents: 10, description: "Spungey")
Product.create(name: "Victoria Cream Cake", price_cents: 5, description: "Creamy victorianus")
