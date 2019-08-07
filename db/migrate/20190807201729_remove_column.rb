class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :pat_count
  end
end
