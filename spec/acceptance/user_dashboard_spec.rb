require 'acceptance/acceptance_helper'

feature 'User dashboard', %q{
  In order to give users a presence on the site
  As a user
  I want to create a simple profile
} do

  scenario 'User signs up, redirected to dashboard, edits profile' do
    ##################
    # Sign up
    ##################
    visit sign_up_path
    email, password = Faker::Internet.email, "password"
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    expect {
      click_button "Sign up"
    }.to change(User, :count).by(1)

    ##################
    # On dashboard page
    ##################

    user = User.find_by_email email

    page.should have_content email
    page.should have_selector "#profile-image img"
    page.should have_content "Reviews"
    page.should have_content "Locations Visited"
    page.should have_content "Average Review"

    page.should have_content "Recent Images"
    page.should have_content "Recent Reviews"
    # this should only appear with no reviews
    page.should have_selector "a", text: "Review a tapa"
    page.should have_selector "a", text: "Edit profile"

    ##################
    # Edit profile
    ##################

    click_link    "Edit profile"
    fill_in       "Username",  with: "fartfart"
    click_button  "Update Profile"
    # back on dashboard page
    page.should have_content "fartfart"
    page.should_not have_content email

    ##################
    # Images and reviews
    ##################

    5.times { tapa = create(:tapa); user.add_tapa tapa }

    visit dashboard_path

    page.should have_selector "span.score", text: "5"
    page.should have_selector "li.recent-image img", count: 5
    average = user.tapas.sum { |tapa| tapa.rating.score } / user.tapas.count
    page.should have_selector "span.score", text: average.to_s
    page.should have_content Tapa.order("created_at DESC").first.title
  end

end
