class Profile < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :albums, dependent: :destroy
  validates_uniqueness_of :user_id, message: "profile can not have more than one user"
end
