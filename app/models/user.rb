class User < ApplicationRecord
    has_many :photos
    has_many :albums
    has_many :comments
    mount_uploader :avatar, AvatarUploader
end
