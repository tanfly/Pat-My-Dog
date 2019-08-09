class RemoveColumnUserIdFromPats < ActiveRecord::Migration[5.2]
  def change
    remove_column :pats, :user_id
  end
end
