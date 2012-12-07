module UserHelper
  def username
    current_user.username ? current_user.username : current_user.email
  end
end
