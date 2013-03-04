class AddIsActiveToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :is_active, :boolean
  end
end
