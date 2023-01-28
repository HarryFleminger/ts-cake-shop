# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Generating cakes!"
cheese_cake = Product.create(name: "Cheese Cake", sku: "original-cheese-cake", price_cents: 15000, description: "Cheesy goodnes")
sponge_cake = Product.create(name: "Sponge Cake", sku: "spunge-cake", price_cents: 10000, description: "Spongey")
victoria_cake = Product.create(name: "Victoria Cream Cake", sku: "victoria-cake", price_cents: 5000, description: "Creamy victorianus")

puts "Generating main user"
main_user = User.create!(first_name: "Ben", last_name: "Franky", email: "ben.franky@hotmail.com", password: 123456)

puts "Creating order for main user"
an_order = Order.new
an_order.user = main_user
an_order.save

puts "Creating line_items for basket"
line1 = LineItem.new
line1.order = an_order
line1.product = cheese_cake
line1.quantity = 2
line1.save

line2 = LineItem.new
line2.order = an_order
line2.product = sponge_cake
line2.quantity = 4
line2.save

line3 = LineItem.new
line3.order = an_order
line3.product = victoria_cake
line3.quantity = 1
line3.save

puts "A seed's happy ending. It was succesfull!"
