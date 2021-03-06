source 'https://rubygems.org'

#set version of ruby for rails to use in heroku
ruby "2.2.0"

# Use devise for authentication
gem 'devise'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# Use sqlite3 as the development database and posgresql for Active Record
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'sqlite3'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use Faker gem to seed db
gem 'faker'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# use figaro for config variables
gem 'figaro', '1.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

#use the bootstrap gem
gem 'bootstrap-sass', '~> 3.3.0'

# Use pundit for authorization
gem 'pundit'

# use redcarpet for markdown
gem 'redcarpet'

# image upload gem
gem 'carrierwave'

# image manipulation gem
gem 'mini_magick'

# for amazon s3
gem 'fog'

# pagination gem
gem 'will_paginate', '~> 3.0.5'

# new relic
gem 'newrelic_rpm'

#use puma web server
gem 'puma'
gem "rack-timeout"

group :development, :test do
  gem 'pry'
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara', '~> 2.4.4'
  gem 'factory_girl_rails', '~> 4.0'
end