class Post < ActiveRecord::Base
  default_scope order('created_at DESC')
  scope :non_top, where(:is_top_article => false) 
  scope :popular, unscoped.order('view_count DESC').limit(5)

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

end


