class CreatePats < ActiveRecord::Migration[5.2]
  def change
    create_table :pats do |t|
      t.integer :count
      t.integer :user_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
