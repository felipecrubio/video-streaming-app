# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require "open-uri"

puts "[1/4] - Cleaning database
\n"
Message.destroy_all
Videoroom.destroy_all
User.destroy_all

puts "[2/4] - Creating 2 users...
\n"
p User.create!(first_name: "Seb", last_name: "Sheldon", email: "seb@test.com", password: "secret")
p User.create!(first_name: "Boris", last_name: "Bora", email: "boris@test.com", password: "secret")

puts "\n[3/4] - Creating 5 videorooms...
\n"
5.times do |i|
  videoroom = Videoroom.new
  videoroom.name = Faker::Company.name
  file = URI.open("https://img.freepik.com/premium-vector/raised-hands-volunteers-concept_36244-204.jpg")
  videoroom.video.attach(io: file, filename: "myimage.jpg", content_type: "image/jpg")
  videoroom.save!

  puts "#{i + 1}. #{videoroom.name}"
end
puts "\n[4/4] - Finished!
\n"
