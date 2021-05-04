class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.find_by(id: params[:id])
    
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @user.profile_photo.present?
      # binding.pry
      @user.save
      redirect_to root_path
      flash[:notice] = 'プロフィール写真を設定しました！'
    else
      redirect_to root_path
      flash[:alert] = 'プロフィール写真の設定を失敗しました！'
    end
  end


end
