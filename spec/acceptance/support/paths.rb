module NavigationHelpers
  # Put helper methods related to the paths in your application here.

  def homepage
    "/"
  end

  def sign_up_path
    "/users/sign_up"
  end

  def sign_in_path
    "/users/sign_in"
  end
end

RSpec.configuration.include NavigationHelpers, :type => :acceptance
