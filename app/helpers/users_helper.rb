module UsersHelper
  def user_avatar(user)
    user.avatar.attached? ? user.avatar : asset_path('default.png')
  end

  def share_qrcode(user)
    user.generate_qrcode if user.qrcode.nil?

    user.qrcode
  end
end
