puts "Generating cakes!"
cheese_cake = Product.new(name: "Cheese Cake", price: 15, description: "Cheesy goodness")
sponge_cake = Product.new(name: "Sponge Cake", price: 10, description: "Spongey")
birthday_cake = Product.new(name: "Birthday Cake", price: 5, description: "Creamy victorianus")

puts "Attaching photos"
cheese_cake_photo = URI.open("https://res.cloudinary.com/dblvfwtds/image/upload/v1675593590/photo-1673280115847-ca8db581acbb_plg3uc.jpg")
cheese_cake.photos.attach(io: cheese_cake_photo, filename: "Cheese_cake.jpg", content_type: "image/jpg")

sponge_cake_photo = URI.open("https://res.cloudinary.com/dblvfwtds/image/upload/v1675593488/photo-1675227977042-a572dac762be_o7ednr.jpg")
sponge_cake.photos.attach(io: sponge_cake_photo, filename: "Sponge_cake.jpg", content_type: "image/jpg")

birthday_cake_photo = URI.open("https://res.cloudinary.com/dblvfwtds/image/upload/v1675593531/photo-1673417284575-cb29c8631125_gmcwbo.jpg")
birthday_cake.photos.attach(io: birthday_cake_photo, filename: "Birthday_cake.jpg", content_type: "image/jpg")

cheese_cake.save!
sponge_cake.save!
birthday_cake.save!

puts "Generating main user"
main_user = User.create!(first_name: "Ben", last_name: "Franky", email: "harry.fleminger@hotmail.com", password: 123456)

admin_user = User.create!(first_name: "Dan", last_name: "Cranky", email: "dan.cranky@hotmail.com", password: 654321, admin: true)
