class Job < ApplicationRecord
	belongs_to :category
	mount_uploader :image, PhotoUploader
end