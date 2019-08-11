class AddProfileIdToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :profile_id, :integer
  end
end
