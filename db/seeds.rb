# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create Posts
50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
  )
end

posts = Post.all

#Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

# Create Advertisements
10.times do
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    copy:  Faker::Lorem.paragraph,
    price: 1 + Random.rand(1000)
  )
end

puts "Seed finished"
puts "#{Post.count} posts in database."
puts "#{Comment.count} comments in database."
puts "#{Advertisement.count} ads in the database"
