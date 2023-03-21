puts "Generating cakes!"
kripsy_kreme = Product.new(name: "Kripsy Kreme Cake", price: 50, description: "Cheesy goodness")
hulk_cake = Product.new(name: "Hulk Cake", price: 35, description: "A marvel universe cake")
jungle_cake = Product.new(name: "The Jungle Cake", price: 40, description: "A wild cake")
minimal_cake = Product.new(name: "The Minimal Cake", price: 38, description: "Minimal but tasty")
princess_cake = Product.new(name: "A Princess Cake", price: 66, description: "A princesses dream")
pokemon_cake = Product.new(name: "The Pokey Cake", price: 38, description: "A pokemon lovers cake")

puts "Attaching product photos"
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

puts "Generating custom cakes"
inch4 = CustomCake.new(name: "4 Inch", price: 60, description: "8-10 slices")
inch6 = CustomCake.new(name: "6 Inch", price: 70, description: "20-25 slices")
inch8 = CustomCake.new(name: "8 Inch", price: 85, description: "45-50 slieces")
inch4_6 = CustomCake.new(name: "4 & 6 Inch - Two Tier", price: 130, description: "35 slices")
inch3_8 = CustomCake.new(name: "4 & 8 Inch - Two Tier", price: 160, description: "75 slices")
full_custom = CustomCake.new(name: "Full Custom", price: 85, description: "20-50slices")

puts "Generating custom cake photos"
inch4_photo = URI.open("https://res.cloudinary.com/dblvfwtds/image/upload/v1678728066/289481912_341253488161197_2848639002910872896_n_mr4op1.jpg")
inch4.photo.attach(io: inch4_photo, filename: "inch4.jpg", content_type: "image/jpg")

inch6_photo = URI.open("https://res.cloudinary.com/dblvfwtds/image/upload/v1678728066/289481912_341253488161197_2848639002910872896_n_mr4op1.jpg")
inch6.photo.attach(io: inch6_photo, filename: "inch6.jpg", content_type: "image/jpg")

inch8_photo = URI.open("https://res.cloudinary.com/dblvfwtds/image/upload/v1678728066/289481912_341253488161197_2848639002910872896_n_mr4op1.jpg")
inch8.photo.attach(io: inch8_photo, filename: "inch8.jpg", content_type: "image/jpg")

inch4_6_photo = URI.open("https://res.cloudinary.com/dblvfwtds/image/upload/v1678728066/289481912_341253488161197_2848639002910872896_n_mr4op1.jpg")
inch4_6.photo.attach(io: inch4_6_photo, filename: "inch4_6.jpg", content_type: "image/jpg")

inch3_8_photo = URI.open("https://res.cloudinary.com/dblvfwtds/image/upload/v1678728066/289481912_341253488161197_2848639002910872896_n_mr4op1.jpg")
inch3_8.photo.attach(io: inch3_8_photo, filename: "inch3_8.jpg", content_type: "image/jpg")

full_custom_photo = URI.open("https://res.cloudinary.com/dblvfwtds/image/upload/v1678728066/289481912_341253488161197_2848639002910872896_n_mr4op1.jpg")
full_custom.photo.attach(io: full_custom_photo, filename: "full_custom.jpg", content_type: "image/jpg")

inch4.save!
inch6.save!
inch8.save!
inch4_6.save!
inch3_8.save!
full_custom.save!

# puts "Generating custom cake flavours"

Flavour.create!(name: "Classic Vanilla", description: "A light vanilla bean sponge, layered with vanilla buttercream and strawberry or raspberry conserve")
Flavour.create!(name: "Chocolate", description: "A rich chocolate sponge, layered with chocolate buttercream and chocolate ganache")
Flavour.create!(name: "Red Velvet", description: "A moist red velvet sponge, layered with cream cheese buttercream and strawberry conserve")
Flavour.create!(name: "Zesty Lemon", description: "A light lemon sponge, layered with lemon buttercream and lemon curd")
Flavour.create!(name: "Black Forest", description: "A light chocolate sponge, layered with chocolate buttercream, cherry conserve and chocolate ganache")
Flavour.create!(name: "Biscoff", description: "A light vanilla sponge, layered with biscoff buttercream and biscoff spread")
Flavour.create!(name: "Cookies and Cream", description: "A light vanilla sponge, layered with cookies and cream buttercream and crushed oreos")
Flavour.create!(name: "Coco X Passion", description: "A light chocolate sponge, layered with passion fruit and buttercream curd")
Flavour.create!(name: "Nutella", description: "A light chocolate sponge, layered with nutella buttercream and nutella spread")
Flavour.create!(name: "Salted Caramel", description: "A light vanilla sponge, layered with salted caramel buttercream and salted caramel sauce")

puts "Generating main user"
main_user = User.create!(first_name: "Ben", last_name: "Franky", email: "harry.fleminger@hotmail.com", password: 123456)

admin_user = User.create!(first_name: "Dan", last_name: "Cranky", email: "dan.cranky@hotmail.com", password: 654321, admin: true)
