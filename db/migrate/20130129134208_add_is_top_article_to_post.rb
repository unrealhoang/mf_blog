class AddIsTopArticleToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :is_top_article, :boolean
  end
end
