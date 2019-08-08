class RemoveColumnCountFromPats < ActiveRecord::Migration[5.2]
  def change
    remove_column :pats, :count
  end
end
