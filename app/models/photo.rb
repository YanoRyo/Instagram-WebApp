class Photo < ApplicationRecord
  belongs_to :post

  validates :image, presence: true
  #Photoモデルのimageカラムと、先ほど作成したアップローダーImageUploaderと紐付け
  mount_uploader :image, ImageUploader
end
