class Profile < ApplicationRecord
	mount_uploader :prof_image, PictureUploader
  belongs_to :user

  validates :name, presence: true
  validates :country,  presence: true
  validates :biography,  presence: true

end
