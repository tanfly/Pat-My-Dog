class Comment < ApplicationRecord
    belongs_to :poster, class_name: 'User', foreign_key: 'user_id'
    belongs_to :post, class_name: 'Photo', foreign_key: 'photo_id'
end
