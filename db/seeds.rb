# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Reservation.destroy_all
Listing.destroy_all
City.destroy_all
require 'faker'

# Seed for City
10.times do |index|
  City.create(
    name: Faker::Address.city,
    zip_code: "33#{index.to_s}00"
  )
end

# Seed for User
20.times do
  User.create!(
    email: Faker::Internet.email,
    phone_number: "+33666666677",
    description: Faker::Quote.famous_last_words
  )
end


# Seed for Listing
50.times do 
  Listing.create(
    available_beds: rand(1..5),
    price: rand(10..100),
    description: Faker::Lorem.paragraph(sentence_count: 5),
    has_wifi: Faker::Boolean.boolean,
    welcome_message: "Greetings from your next accomodations",
    city: City.all.sample,
    admin: User.all.sample
  )
end

# Seed for Reservation
Listing.all.each do |listing|
	10.times do |index|
		index = index - 5
		length = rand(5)
		start_date = Time.now + ((index)*5).day
		end_date = start_date + length.day 
		Reservation.create(
	    start_date: start_date,
	    end_date: end_date,
	    guest: User.all.sample,
	    listing: listing
		)
	end
end