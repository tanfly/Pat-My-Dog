class RemoveUserIdFromAlbums < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :user_id
  end
end
