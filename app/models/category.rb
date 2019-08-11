class Category < ApplicationRecord
    has_many :photo_categories
    has_many :photos, through: :photo_categories

    def categories_attributes=(categories_hashes)
        categories_hashes.each do |i, categories_attributes|
            if categories_attributes[:name].present?
            category = Category.find_or_create_by(name: category_attributes[:name])
            self.photo_categories.build(:category => category)
            end
        end
    end
end
