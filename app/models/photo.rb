class Photo < ApplicationRecord
    has_many :photo_categories
    has_many :categories, through: :photo_categories
    belongs_to :user
    belongs_to :album, optional: true
    accepts_nested_attributes_for :categories
    validates_presence_of :image, :category_id
end
