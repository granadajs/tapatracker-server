Spinach::FeatureSteps.send(:include, Rack::Test::Methods)
class Spinach::FeatureSteps
  def app
    Tapatracker::Application
  end
end