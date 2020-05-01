# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.destroy_all
User.destroy_all
require 'faker'

# Seed for City
10.times do
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip.first(5)
    )
end

# Seed for User
20.times do
  User.create!(
    email: Faker::Internet.email,
    phone_number: "+33666666677"
  )
end