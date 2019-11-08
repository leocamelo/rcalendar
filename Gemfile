source 'https://rubygems.org'
ruby '2.6.5'

gem 'rails', '~> 4.2'
gem 'pg', '~> 0.21'
gem 'sassc-rails', '~> 2.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'responders'

group :development, :test do
  gem 'byebug'
  gem 'spring'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :production do
  gem 'rails_12factor'
  gem 'heroku-deflater'
  gem 'unicorn', platforms: :ruby
end
