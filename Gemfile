source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# DRY for API actions
gem 'responders'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # RSpec for unit tests
  gem 'rspec-rails'
  # collection of testing matchers
  gem 'shoulda-matchers'
  # fixtures replacement with FactoryGirl
  gem 'factory_girl_rails'
end

group :production do
  # The Twelve-Factor App for Heroku
  gem 'rails_12factor'
  # Enable Rack Deflater in Heroku
  gem 'heroku-deflater'
  # Use Unicorn as the app server
  gem 'unicorn', platforms: :ruby
end
