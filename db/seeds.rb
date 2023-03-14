puts "Generating cakes!"
kripsy_kreme = Product.new(name: "Kripsy Kreme Cake", price: 50, description: "Cheesy goodness")
hulk_cake = Product.new(name: "Hulk Cake", price: 35, description: "A marvel universe cake")
jungle_cake = Product.new(name: "The Jungle Cake", price: 40, description: "A wild cake")
minimal_cake = Product.new(name: "The Minimal Cake", price: 38, description: "Minimal but tasty")
princess_cake = Product.new(name: "A Princess Cake", price: 66, description: "A princesses dream")
pokemon_cake = Product.new(name: "The Pokey Cake", price: 38, description: "A pokemon lovers cake")

puts "Attaching photos"
kripsy_kreme_photo = URI.open("https://res.cloudinary.com/dblvfwtds/image/upload/v1678728176/311778893_158950273492930_6278858559472575134_n_zdtpm5.jpg")
kripsy_kreme.photos.attach(io: kripsy_kreme_photo, filename: "kripsy_kreme.jpg", content_type: "image/jpg")

hulk_cake_photo = URI.open("https://res.cloudinary.com/dblvfwtds/image/upload/v1678728066/288913300_554856272796740_5803513019029902746_n_vvgjj6.jpg")
hulk_cake.photos.attach(io: hulk_cake_photo, filename: "hulk_cake.jpg", content_type: "image/jpg")

jungle_cake_photo = URI.open("https://res.cloudinary.com/dblvfwtds/image/upload/v1678728066/291921980_421220526549742_2096783482414313376_n_njxilc.jpg")
jungle_cake.photos.attach(io: jungle_cake_photo, filename: "jungle_cake.jpg", content_type: "image/jpg")

minimal_cake_photo = URI.open("https://res.cloudinary.com/dblvfwtds/image/upload/v1678728066/289481912_341253488161197_2848639002910872896_n_mr4op1.jpg")
minimal_cake.photos.attach(io: minimal_cake_photo, filename: "minimal_cake.jpg", content_type: "image/jpg")

princess_cake_photo = URI.open("https://res.cloudinary.com/dblvfwtds/image/upload/v1678728066/312278684_509697074352981_98360624366357888_n_vdcube.jpg")
princess_cake.photos.attach(io: princess_cake_photo, filename: "princess_cake.jpg", content_type: "image/jpg")

pokemon_cake_photo = URI.open("https://res.cloudinary.com/dblvfwtds/image/upload/v1678728065/312326843_364092999210077_7774964861317527094_n_kb69sf.jpg")
pokemon_cake.photos.attach(io: pokemon_cake_photo, filename: "pokemon_cake.jpg", content_type: "image/jpg")

kripsy_kreme.save!
hulk_cake.save!
jungle_cake.save!
minimal_cake.save!
princess_cake.save!
pokemon_cake.save!

puts "Generating main user"
main_user = User.create!(first_name: "Ben", last_name: "Franky", email: "harry.fleminger@hotmail.com", password: 123456)

admin_user = User.create!(first_name: "Dan", last_name: "Cranky", email: "dan.cranky@hotmail.com", password: 654321, admin: true)
