class RemoveIsActiveFromProfiles < ActiveRecord::Migration
  def up
    remove_column :profiles, :is_active
  end

  def down
    add_column :profiles, :is_active, :boolean
  end
end
