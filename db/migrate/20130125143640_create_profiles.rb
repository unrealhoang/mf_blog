class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :password
      t.string :avatar
      t.text :biography
      t.string :facebook
      t.string :linkedin
      t.string :twitter

      t.timestamps
    end
  end
end
