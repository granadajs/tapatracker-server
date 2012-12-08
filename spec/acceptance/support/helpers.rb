module HelperMethods
  # Put helper methods you need to be available in all acceptance specs here.

  def tapa_image
    File.expand_path("../../fixtures/tapa_image.jpg", __FILE__)
  end

  def sign_in user=nil
    password = "password"
    @user = user || create(:user, password: password)
    visit sign_in_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: password
    click_button "Sign in"
  end

  def sign_up
    visit sign_up_path
    email, password = Faker::Internet.email, "password"
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_button "Sign up"
    user = User.find_by_email email
    [user,email,password]
  end

end

RSpec.configuration.include HelperMethods, :type => :acceptance
