class Album < ApplicationRecord
    belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
    has_many :photos
    validates_presence_of :name
end
