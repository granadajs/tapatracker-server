require 'acceptance/acceptance_helper'

feature 'User dashboard', %q{
  In order to give users a presence on the site
  As a user
  I want to create a simple profile
} do

  scenario 'User signs up, redirected to dashboard' do
    visit sign_up_path
    email, password = Faker::Internet.email, "password"
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    expect {
      click_button "Sign up"
    }.to change(User, :count).by(1)

    user = User.find_by_email email

    page.should have_content email
    page.should have_selector "#profile-image img"
    page.should have_content "Reviews"
    page.should have_content "Locations Visited"
    page.should have_content "Average Review"

    page.should have_content "Recent Images"
    page.should have_content "Recent Reviews"
    # this should only appear with no reviews
    save_and_open_page
    page.should have_selector "a", text: "Review a tapa"

    page.should have_selector "a", text: "Edit profile"

  end

end
