ENV['RAILS_ENV'] = 'test'
require './config/environment'

require 'minitest/spec'
require 'capybara/rails'
require 'spinach-rails'

Spinach.config.save_and_open_page_on_failure = true
