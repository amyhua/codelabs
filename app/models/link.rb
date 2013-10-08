class Link < ActiveRecord::Base
  attr_accessible :description, :image, :title, :url, :category_id
  belongs_to :category
end
