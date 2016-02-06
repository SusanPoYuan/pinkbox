class Image < ActiveRecord::Base
	belongs_to :products
	mount_uploader :image, ImageUploader 
end
