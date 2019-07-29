class Profile < ApplicationRecord
	mount_uploader :prof_image, PictureUploader
  belongs_to :user
end
