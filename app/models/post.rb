class Post < ActiveRecord::Base
  attr_accessible :author, :content, :title
  has_many :tags
  belongs_to :profile, :foreign_key => :author_id
  belongs_to :category, :foreign_key => :category_id
end
