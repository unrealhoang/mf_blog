class RemoveUsernameAndPasswordFromProfiles < ActiveRecord::Migration
  def up
    remove_column :profiles, :username
    remove_column :profiles, :password
  end

  def down
    add_column :profiles, :password, :string
    add_column :profiles, :username, :string
  end
end
