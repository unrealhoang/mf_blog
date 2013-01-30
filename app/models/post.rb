class Post < ActiveRecord::Base
  attr_accessible :author, :content, :title, :author_id, :category_id, :is_top_article, :image

  has_and_belongs_to_many :tags
  belongs_to :author, :class_name => :profile, :foreign_key => :author_id, :validate => true
  belongs_to :category, :validate => true

  def save
  	Post.update_all(:is_top_article => false) if self.is_top_article
  	super
  end

  def update_attributes(params)
  	Post.update_all(:is_top_article => false) if self.is_top_article
  	super(params)
  end
end

