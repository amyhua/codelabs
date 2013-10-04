class Lesson < ActiveRecord::Base
  attr_accessible :content, :date, :description, :name
end
