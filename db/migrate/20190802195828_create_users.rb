class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.datetime :last_login
      t.datetime :member_since
      t.integer :age
      t.string :location
    end
  end
end
