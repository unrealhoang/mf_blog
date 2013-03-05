class AddTopArticleImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :top_article_image, :string
  end
end
