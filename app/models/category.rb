class Category < ActiveRecord::Base
  attr_accessible :name, :color
  has_many :links
end
