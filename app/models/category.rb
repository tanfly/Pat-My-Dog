class Category < ApplicationRecord
    has_many :photo_categories
    has_many :photos, through: :photo_categories
    validates_presence_of :name

    def categories_attributes=(categories_hashes)
        categories_hashes.each do |i, category_attributes|
            if category_attributes[:name].present?
            category = Category.find_or_create_by(name: category_attributes[:name])
            self.post_categories.build(:category => category)
            end
        end
    end
end
