class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :photo
    validates_presence_of :content, :photo_id, :user_id

    def comment_user
        if self.user_id
        User.find(self.user_id).username
        end
    end
end
