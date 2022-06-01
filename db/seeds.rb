# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(
  email: Faker::Internet.email,
  password: "password"
)

2.times do
  Dog.create!(
    name: Faker::Creature::Dog.name,
    breed: Faker::Creature::Dog.breed,
    age: rand(17),
    location: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    sex: [true, false].sample,
    photos: []
  )
end
