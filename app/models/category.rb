class Category < ActiveRecord::Base
  attr_accessible :description, :name, :parent_category
  has_many :child_category, :class_name => :category,
    :foreign_key => :parent_category
  belongs_to :parent_category, :class_name => :category
end
