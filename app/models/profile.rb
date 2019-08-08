class Profile < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user_id, message: "profile can not have more than one user"
end
