class AddUserIdBackToPats < ActiveRecord::Migration[5.2]
  def change
    add_column :pats, :user_id, :integer
  end
end
