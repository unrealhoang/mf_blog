class Profile < ActiveRecord::Base
  attr_accessible :avatar, :biography, :facebook, :linkedin, :password, :twitter, :username
end
