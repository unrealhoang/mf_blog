class Post < ActiveRecord::Base
  scope :non_top, where(:is_top_article => false) 

  attr_accessible :author, :content, :title, :author_id, :category_id, :is_top_article, :image, :tags, :top_article_image, :view_count

  has_and_belongs_to_many :tags
  belongs_to :author, :class_name => 'Profile', :foreign_key => :author_id, :validate => true
  belongs_to :category, :validate => true

  before_save :unique_top_article

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

  def self.top_article
    Post.where(:is_top_article => true).first
  end

  private
    def unique_top_article
      Post.update_all(:is_top_article => false) if self.is_top_article
    end
end


