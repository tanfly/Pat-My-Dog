class User < ApplicationRecord
    has_secure_password
    has_many :photos, dependent: :destroy
    has_many :albums, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :pats, dependent: :destroy
    validates_presence_of :name
    validates_uniqueness_of :email, :password_digest
    mount_uploader :avatar, AvatarUploader
end
