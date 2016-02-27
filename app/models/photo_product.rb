class PhotoProduct < ActiveRecord::Base
	mount_uploader :image, ImageUploader
end
