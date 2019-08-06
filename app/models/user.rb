class User < ApplicationRecord
    has_many :photos
    has_many :albums
    has_many :comments
    validates_presence_of :name
    validates_uniqueness_of :email, :password_digest
    mount_uploader :avatar, AvatarUploader
end
