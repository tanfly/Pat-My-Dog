class Comment < ApplicationRecord
    belongs_to :user, foreign_key: 'user_id'
    belongs_to :photo, foreign_key: 'photo_id'
    validates_presence_of :content, :user_id
end
