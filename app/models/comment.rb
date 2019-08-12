class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :photo
    validates_presence_of :content, :photo_id, :user_id
end
