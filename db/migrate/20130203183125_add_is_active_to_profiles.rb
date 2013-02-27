class AddIsActiveToProfiles < ActiveRecord::Migration
  def change
    change_table :profiles do |t|
      t.column :is_active, :boolean
    end
  end
end
