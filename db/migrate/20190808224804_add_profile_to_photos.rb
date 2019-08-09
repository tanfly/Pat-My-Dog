class AddProfileToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :profile_id, :integer
  end
end
