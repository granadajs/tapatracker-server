require 'rack/utils'
Capybara.app = Rack::ShowExceptions.new(Tapatracker::Application)

require 'capybara/poltergeist'
Capybara.register_driver :poltergeist do |app|
  options = {
    :inspector => "open"
  }
  Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.javascript_driver = :poltergeist
Capybara.default_driver = :poltergeist
