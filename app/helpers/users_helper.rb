module UsersHelper
  def user_avatar(user)
    user.avatar? ? user.avatar.url : asset_path('user.png')
  end

  def user_avatar_thumb(user)
    user.avatar.file.present? ? user.avatar.thumb.url : asset_path('user.png')
  end
end
