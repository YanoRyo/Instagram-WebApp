class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy

  has_many :likes

  has_many :comments
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  validates :name,presence: true,length: { maximum: 50}
  validates :profile_photo, presence: true
  #Userモデルのprofile_photoカラムと、先ほど作成したアップローダーImageUploaderと紐付け
  mount_uploader :profile_photo, ImageUploader
 # ==========パスワードを入力しなくてもプロフィールの情報を編集できるよう==========
  def update_without_current_password(params, *options)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end
   # ==========パスワードを入力しなくてもプロフィールの情報を編集できるよう==========
end
