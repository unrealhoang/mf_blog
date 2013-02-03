class Category < ActiveRecord::Base
  attr_accessible :description, :name, :parent_category_id

  has_many :child_category, :class_name => 'Category',
    :foreign_key => :parent_category_id
  belongs_to :parent_category, :class_name => 'Category'
end
