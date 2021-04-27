#ログインしているUserがパスワードを変更する事なく、プロフィールを変更できる様にする
class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  # ==========プロフィール編集後はログインしているユーザーのプロフィールページにリダイレクト==========
  def after_update_path_for(resource)
    user_path(resource)
  end
  # ==========プロフィール編集後はログインしているユーザーのプロフィールページにリダイレクト==========

end
