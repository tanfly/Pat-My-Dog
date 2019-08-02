class CreatePhotoCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :photo_categories do |t|
      t.integer :photo_id
      t.integer :category_id
    end
  end
end
