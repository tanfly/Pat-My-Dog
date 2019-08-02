class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :description
      t.integer :pat_count
      t.integer :user_id
      t.integer :album_id
    end
  end
end
