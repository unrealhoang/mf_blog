class AddProfileIdToAdminUser < ActiveRecord::Migration
  def change
    change_table :admin_users do |t|
      t.references :profile
    end
  end
end
