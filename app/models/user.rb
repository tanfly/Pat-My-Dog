class User < ApplicationRecord
    has_many :photos
    has_many :albums
    has_many :comments
    validates_presence_of :name, :password
    validates_uniqueness_of :email, :password
    mount_uploader :avatar, AvatarUploader
end
