class RemoveProfileIdFromPats < ActiveRecord::Migration[5.2]
  def change
    remove_column :pats, :profile_id
  end
end
