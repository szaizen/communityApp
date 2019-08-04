class Profile < ApplicationRecord
  
  belongs_to :user

	mount_uploader :prof_image, PictureUploader

  validates :name, presence: true
  validates :country,  presence: true
  validates :biography,  presence: true

end
