class Tag < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :posts

  def to_param
    "#{id}-#{name.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/,'').parameterize}"
  end
end
