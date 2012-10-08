source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem "devise"
gem "sqlite3"
gem "compass-rails", :group => :assets
gem "bootstrap-sass"
gem "rails_bootstrap_helpers"
gem "pry-rails", :group => :development
gem "pry-nav", :group => :development

group :test, :development do
  gem 'spinach-rails'  
end

group :test do
  gem 'rspec-rails'
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'spork', '~> 1.0rc'
  gem 'listen', git: "git://github.com/guard/listen.git"
  gem 'launchy'
  gem 'capybara'
  # gem 'capybara-webkit'
  gem 'poltergeist'
  gem 'mocha', require: "mocha_standalone"
  gem 'growl'
  gem 'faker'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'
