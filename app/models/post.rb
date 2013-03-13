class Post < ActiveRecord::Base
  default_scope order('created_at DESC')
  scope :non_top, where(:is_top_article => false) 
  scope :popular, order('view_count DESC').order('created_at DESC').limit(5)

  attr_accessible :author, :content, :title, :author_id, :category_id, :is_top_article, :image, :tags, :top_article_image, :view_count

  has_and_belongs_to_many :tags
  belongs_to :author, :class_name => 'Profile', :foreign_key => :author_id, :validate => true
  belongs_to :category, :validate => true

  self.per_page = 5

  def tags=(tag_names)
    tag_names = tag_names.split(',')
    self.tags.clear
    tag_names.each do |t|
      self.tags << Tag.where(:name => t).first_or_create
    end
  end

  def self.simple_search(query, page)
    paginate :per_page => 5, :page => page,
       :conditions => ['content ~~* ?', "%#{query}%"]
  end

  def self.top_articles
    result = Post.where(:is_top_article => true)
    result.empty? ? nil : result
  end

  def popular_posts_same_category
    self.category.posts.unscoped.where("id != ?", self.id).popular
  end

  def related_posts
    Post.unscoped.where
    ("id IN 
      (
        SELECT p.post_id FROM 
        (
          SELECT post_id, count(*) FROM posts_tags p WHERE tag_id IN
            (SELECT tag_id FROM posts_tags WHERE post_id = ?)
          GROUP BY post_id ORDER BY 2 DESC
        ) p
        WHERE p.post_id != ?

        UNION

        SELECT post_id FROM posts WHERE category_id = ? 
        ORDER BY (created_at - (SELECT created_at FROM posts WHERE post_id = ?)) LIMIT 5
      )", self.id, self.id, self.category_id, self.id
    )

  end

end


