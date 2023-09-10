module UsersHelper
  def user_avatar(user)
    user.avatar.attached? ? user.avatar : asset_path('default.png')
  end

  def share_qrcode(user)
    user.generate_qrcode if user.qrcode.nil?

    user.qrcode
  end

  def follow(user)
    return if user == current_user
    
    if current_user.followees.include?(user)
      button_to unfollow_user_path(user), method: :post, class: 'btn btn-sm btn-outline-primary' do
        "Unfollow <i class='fa fa-user-xmark mx-1' aria-hidden='true'></i>".html_safe
      end
    else
      button_to follow_user_path(user), method: :post, class: 'btn btn-sm btn-primary' do
        "Follow <i class='fa fa-user-plus mx-1' aria-hidden='true'></i>".html_safe
      end
    end
  end
end
