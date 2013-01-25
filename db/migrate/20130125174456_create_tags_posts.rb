class CreateTagsPosts < ActiveRecord::Migration
  def change
    create_table :tags_posts do |t|
      t.references :tag
      t.references :post
    end
  end
end
