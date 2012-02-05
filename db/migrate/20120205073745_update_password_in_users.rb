class UpdatePasswordInUsers < ActiveRecord::Migration
  def up
    add_column :users, :encrypted_password, :string
	remove_column :users, :password, :string
  end

  def down
    remove_column :users, :encrypted_password
	add_column :users, :password, :string
  end
end
