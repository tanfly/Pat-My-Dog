class AddProfileIdToPats < ActiveRecord::Migration[5.2]
  def change
    add_column :pats, :profile_id, :integer
  end
end
