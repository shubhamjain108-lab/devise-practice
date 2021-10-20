module UsersHelper
  def admin_name(user)
    User.find(user).username
  end

  def admin_user(user)
    User.find(user)
  end

end
