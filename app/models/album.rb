class Album < ApplicationRecord
    belongs_to :profile
    has_many :photos, dependent: :destroy
    validates_presence_of :name

    def cover
        photos.first
    end
end
