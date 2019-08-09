class Photo < ApplicationRecord
    has_many :photo_categories
    has_many :categories, through: :photo_categories
    has_many :pats, dependent: :destroy
    belongs_to :profile
    belongs_to :album, optional: true
    accepts_nested_attributes_for :categories, reject_if: :all_blank
    validates_presence_of :image
    mount_uploader :image, PhotoUploader
end
