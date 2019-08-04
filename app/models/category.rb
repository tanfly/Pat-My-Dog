class Category < ApplicationRecord
    has_many :photo_categories
    has_many :photos, through: :photo_categories
    accepts_nested_attributes_for :photos
end
