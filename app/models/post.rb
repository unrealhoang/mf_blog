class Post < ActiveRecord::Base
  attr_accessible :author, :content, :title, :author_id, :category_id
  has_and_belongs_to_many :tags
  belongs_to :author, :class_name => :profile, :foreign_key => :author_id, :validate => true
  belongs_to :category, :validate => true
end
