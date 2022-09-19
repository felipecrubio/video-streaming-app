# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "[1/3] - Cleaning database
\n"
Message.destroy_all
Videoroom.destroy_all
User.destroy_all

puts "[2/3] - Creating 5 videorooms...
\n"
5.times do |i|
  videoroom = Videoroom.create!(name: Faker::Company.name)
  puts "#{i + 1}. #{videoroom.name}"
end
puts "\n[3/3] - Finished!
\n"
