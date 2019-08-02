class Portfolio < ApplicationRecord
  mount_uploader :port_image, PictureUploader
end
