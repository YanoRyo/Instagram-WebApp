module ApplicationHelper
  # ==========profile_photoカラムに何もない場合、デフォルトのアイコンを表示==========
  def avatar_url(user)
    return user.profile_photo unless user.profile_photo.nil?
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://i.pinimg.com/564x/66/a1/01/66a101499104c54d4b57dd4db065393a.jpg"

  end
  # ==========profile_photoカラムに何もない場合、デフォルトのアイコンを表示==========

end
