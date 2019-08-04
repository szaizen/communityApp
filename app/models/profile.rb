class Profile < ApplicationRecord
  
  belongs_to :user, optional: true

	mount_uploader :prof_image, PictureUploader



end
