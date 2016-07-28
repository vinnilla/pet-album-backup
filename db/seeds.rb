# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p1 = Pet.create(name: "Mewtwo", gender: "Female", breed: "Pokemon",bio: "Disastrously powerful")
	a1 = Album.create(title: "Profile", pet_id: p1.id)
	p1 = Photo.create(description: "Profile", album_id: a1.id, avatar: "http://media.animevice.com/uploads/0/697/79673-mewtwo1.jpg")

p2 = Pet.create(name: "Soba", gender: "Male", breed: "Short Hair Cat", bio: "Loves to drool and knead")
p3 = Pet.create(name: "Ramen", gender: "Male", breed: "German Shepard", bio: "Likes noodles")
p4 = Pet.create(name: "Meatloaf", gender: "Female", breed: "Chihuahua", bio: "Likes turkey")
p5 = Pet.create(name: "Hash", gender: "Female", breed: "Hamster", bio: "A bundle of energy")
p6 = Pet.create(name: "Flipper", gender: "Male", breed: "Seal", bio: "Sings like one of the greats")
p7 = Pet.create(name: "Trunks", gender: "Male", breed: "African Elephant", bio: "Power level over 9000")
p8 = Pet.create(name: "Penelope", gender: "Female", breed: "Bengal Cat", bio: "Spends the greater portion of each day pretending to be part of the curtains")
p9 = Pet.create(name: "Rex", gender: "Male", breed: "Husky", bio: "Eats anything and everything")