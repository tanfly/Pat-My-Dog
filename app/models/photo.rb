class Photo < ApplicationRecord
    has_many :photo_categories
    has_many :categories, through: :photo_categories, dependent: :destroy
    has_many :pats, dependent: :destroy
    has_many :comments, dependent: :destroy
    belongs_to :profile
    belongs_to :album, optional: true, dependent: :destroy
    accepts_nested_attributes_for :categories
    validates_presence_of :image
    mount_uploader :image, PhotoUploader

end
