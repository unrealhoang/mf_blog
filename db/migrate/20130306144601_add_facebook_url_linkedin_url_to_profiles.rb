class AddFacebookUrlLinkedinUrlToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :facebook_url, :string
    add_column :profiles, :linkedin_url, :string
  end
end
