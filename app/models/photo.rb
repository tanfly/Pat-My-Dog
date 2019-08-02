class Photo < ApplicationRecord
    has_many :photo_categories
    has_many :categories, through: :photo_categories
    belongs_to :user
    belongs_to :album, optional: true
end
