class Profile < ActiveRecord::Base
  attr_accessible :avatar, :biography, :facebook, :linkedin, :password, :twitter, :username

  has_many :posts, :foreign_key => :author_id
end
