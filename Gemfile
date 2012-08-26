source 'https://rubygems.org'

gem 'rails', '3.2.7'
gem 'heroku'
gem 'bootstrap-sass'
gem 'devise'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'guard-rspec'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'rb-fsevent', require: false
  gem 'growl'
  gem 'guard-spork'
  gem 'spork'
  gem 'factory_girl_rails'
end

group :production do
  gem 'pg'
end
