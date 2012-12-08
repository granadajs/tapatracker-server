require 'acceptance/acceptance_helper'

feature 'Index', %q{
  In order to find out what is close to me
  As a user
  I want see a list of nearby
} do

  scenario 'Index page with login process' do
    VCR.use_cassette('foursquare_from_granada_ip') do
      ip = "83.44.180.77"
      response = Typhoeus::Request.get("https://api.foursquare.com/v2/venues/search?near=Madrid,ES&oauth_token=IFCMZ2BW4RFQBYFOUR0BYF2TTLSPQZQ23ZPHTFAQG0V02LEQ&v=20121208")
      json = Yajl::Parser.parse response.body

      venues = json['response']['venues']

      visit root_path

      page.should have_content "Sign up"
      page.should have_content "Sign in"
      page.should have_content "About"
    end

  end

end
