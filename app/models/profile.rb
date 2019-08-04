class Profile < ApplicationRecord
  
  belongs_to :user

	mount_uploader :prof_image, PictureUploader



end
