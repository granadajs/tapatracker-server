class Signup < Spinach::FeatureSteps
  Given 'I am on the home page' do
    visit root_path
  end

  And 'I sign in with facebook' do
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
       :provider => 'facebook',
       :uid => "monkeyman",
       :info => {
         :email => Faker::Internet.email
       },
       :extra => {
         :raw_info => {
           :name => "Jim Bob"
         }
       }
     })
    click_link "Sign in with Facebook"
  end

  Then 'I should be signed up and logged in' do
    User.find_by_uid("monkeyman").should_not be_nil
  end
end
