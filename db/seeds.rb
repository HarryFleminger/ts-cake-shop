puts "Generating cakes!"
cheese_cake = Product.create(name: "Cheese Cake", price: 15, description: "Cheesy goodnes")
sponge_cake = Product.create(name: "Sponge Cake", price: 10, description: "Spongey")
birthday_cake = Product.create(name: "Birthday Cake", price: 5, description: "Creamy victorianus")

puts "Attaching photos"
# Find out if its possible to attach these photos without uploading them to cloudinary
cheese_cake_photo = URI.open("https://res.cloudinary.com/dblvfwtds/image/upload/v1675593590/photo-1673280115847-ca8db581acbb_plg3uc.jpg")
cheese_cake.photos.attach(io: cheese_cake_photo, filename: "Cheese_cake.jpg", content_type: "image/jpg")

sponge_cake_photo = URI.open("https://res.cloudinary.com/dblvfwtds/image/upload/v1675593488/photo-1675227977042-a572dac762be_o7ednr.jpg")
sponge_cake.photos.attach(io: sponge_cake_photo, filename: "Sponge_cake.jpg", content_type: "image/jpg")

birthday_cake_photo = URI.open("https://res.cloudinary.com/dblvfwtds/image/upload/v1675593531/photo-1673417284575-cb29c8631125_gmcwbo.jpg")
birthday_cake.photos.attach(io: birthday_cake_photo, filename: "Birthday_cake.jpg", content_type: "image/jpg")

puts "Generating main user"
main_user = User.create!(first_name: "Ben", last_name: "Franky", email: "harry.fleminger@hotmail.com", password: 123456)
