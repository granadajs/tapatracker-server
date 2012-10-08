module LoginMacros
  def sign_in
    p = "password"
    @user ||= create(:user)
    @user.activate!
    visit login_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: p
    click_button "Sign in"
  end
end
