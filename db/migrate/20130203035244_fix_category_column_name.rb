class FixCategoryColumnName < ActiveRecord::Migration
  def change
    change_table :categories do |t|
      t.rename :parent_category, :parent_category_id
    end
  end
end
