require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path('../spec_helper_lite', __FILE__)
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'
  #require 'capybara/poltergeist'
  require 'vcr'
  require 'fakeweb'

  VCR.configure do |c|
    c.cassette_library_dir = 'spec/acceptance/fixtures/vcr_cassettes'
    c.hook_into :fakeweb
  end

  RSpec.configure do |config|

    config.include FactoryGirl::Syntax::Methods
    config.include LoginMacros
    config.include DateMacros

    #Capybara.register_driver :selenium do |app|
      #Capybara::Selenium::Driver.new(app, :browser => :chrome)
    #end

    #Capybara.register_driver :poltergeist do |app|
      #Capybara::Poltergeist::Driver.new(app,{})
    #end

    #Capybara.javascript_driver = :selenium
    #Capybara.javascript_driver = :poltergeist
    Capybara.javascript_driver = :webkit
    Capybara.run_server = true
    Capybara.server_port = 7000
    Capybara.app_host = "http://localhost:#{Capybara.server_port}"
    ActionController::Base.asset_host = Capybara.app_host


    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = false

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false

    config.before :each do
      if [:selenium, :webkit, :poltergeist].include? Capybara.current_driver
        DatabaseCleaner.strategy = :truncation
      else
        DatabaseCleaner.strategy = :transaction
      end
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

    config.after(:all) do
      # Get rid of the linked images
      if Rails.env.test? || Rails.env.cucumber?
        FileUtils.rm_rf(Dir["#{Rails.root}/public/uploads/#{Rails.env}/[^.]*"])
        FileUtils.rm_rf(Dir["#{Rails.root}/tmp/uploads/#{Rails.env}/[^.]*"])
      end
    end
  end

end

Spork.each_run do
  ActiveSupport::Dependencies.clear
  ActiveRecord::Base.instantiate_observers
  FactoryGirl.reload
  Dir[Rails.root.join('app/presenters/*.rb')].each{|f| load f}
  Dir[Rails.root.join('lib/**/*.rb')].each{|f| load f}
end if Spork.using_spork?

