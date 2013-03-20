class AddDefaultValueForViewCount < ActiveRecord::Migration
  def change
    change_column_default :posts, :view_count, 0
  end
end
