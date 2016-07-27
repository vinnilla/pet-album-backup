class Photo < ApplicationRecord
	belongs_to :album
	mount_uploader :avatar, AvatarUploader
end
