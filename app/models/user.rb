class User < ApplicationRecord
    has_secure_password
    has_one :profile, dependent: :destroy
    has_many :albums, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :pats, dependent: :destroy
    validates_presence_of :name
    validates_uniqueness_of :email, :password_digest
    mount_uploader :avatar, AvatarUploader
    after_create :make_profile

    def make_profile
        Profile.create(:user_id => self.id)
    end
end
