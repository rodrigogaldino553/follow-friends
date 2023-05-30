module UsersHelper
  
  def user_avatar(user)
    user.avatar.attached? ? user.avatar : asset_path('default.png')
  end

end
