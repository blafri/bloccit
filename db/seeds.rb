# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  
  user.skip_confirmation!
  user.save!
end

# Create Topics
25.times do
  Topic.create!(
    name:        Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph
  )
end
topics = Topic.all

users = User.all

# Create Posts
50.times do
  post = Post.new(
    user:  users.sample,
    topic: topics.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
  )
  
  # set the created_at to a time within the past year
  post.save_with_initial_vote
  post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
end

posts = Post.all

#Create Comments
100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

#Create Votes
200.times do
  val = [-1, 1].sample
  user = users.sample
  post = posts.sample
  
  if Vote.where("user_id = ? AND post_id = ?", user, post).count == 0
    Vote.create!(
      value: val,
      user: user,
      post: post
    )
  end
end

# Create an admin user
admin = User.new(
  name:     'Blayne Farinha',
  email:    'blayne.farinha@gmail.com',
  password: 'C00lness',
  role:     'admin'
)
admin.skip_confirmation!
admin.save!

# Create a Moderator
moderator = User.new(
  name:     'Moderator User',
  email:    'moderator@example.com',
  password: 'helloworld',
  role:     'moderator'
)
moderator.skip_confirmation!
moderator.save!

# Create a member
member = User.new(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld'
)
member.skip_confirmation!
member.save!

# Create some recent posts
50.times do
  post = Post.new(
    user:  users.sample,
    topic: topics.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
  )
  
  # set the created_at to a time within the past year
  post.save_with_initial_vote
end

puts "Seed finished"
puts "#{User.count} users in database."
puts "#{Post.count} posts in database."
puts "#{Comment.count} comments in database."
puts "#{Vote.count} votes in the database."