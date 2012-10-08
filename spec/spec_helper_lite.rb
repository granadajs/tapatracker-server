# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(File.expand_path('../..', __FILE__), "spec/support/**/*.rb")].each {|f| require f}

begin
  require 'turn/autorun'
  Turn.config.format = :outline
rescue LoadError
end

def require_in_directory dir, file
  require File.expand_path("../../#{dir}/#{file}.rb", __FILE__)
end

def require_model object
  require_in_directory "app/models", object
end

def require_lib object
  require_in_directory "lib", object
end

def require_controller object
  require_in_directory "app/controllers", object
end

def require_view ctrl, action
  require_in_directory "app/views/#{ctrl}/#{action}", object
end

def require_helper name
  require_in_directory "app/helpers", "#{name}_helper"
end

RSpec.configure do |config|
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  config.mock_with :mocha
end


