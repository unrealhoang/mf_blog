class Category < ActiveRecord::Base
  attr_accessible :description, :name, :parent_category_id

  has_many :child_categories, :class_name => 'Category',
    :foreign_key => :parent_category_id
  belongs_to :parent_category, :class_name => 'Category'

  has_many :posts

  def to_param
    "#{id}-#{name.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/,'').parameterize}"
  end

  def self.hierachized_list
    top_category = where(:parent_category_id => nil).includes(:child_categories).all
    result = []

    top_category.each do |c|
      result << c
      result += c.child_categories.each { |cc| cc.name = "#{c.name} > #{cc.name}" }
    end
    
    return result
  end

end
