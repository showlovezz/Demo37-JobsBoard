class Job < ApplicationRecord
	belongs_to :category
	mount_uploader :image, PhotoUploader
	has_many :skills, inverse_of: :job
  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true
end