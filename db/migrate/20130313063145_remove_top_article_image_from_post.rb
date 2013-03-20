class RemoveTopArticleImageFromPost < ActiveRecord::Migration
  def up
    remove_column :posts, :top_article_image
  end

  def down
    add_column :posts, :top_article_image, :string
  end
end
