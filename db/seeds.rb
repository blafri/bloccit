# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# These two posts must be unique. If they exists in the database already they
# Will not be duplicated
Post.find_or_create_by(title: 'unique', body: 'unique body')

Comment.find_or_create_by(post: Post.find_by(title: 'unique'), body: 'unique comment')

