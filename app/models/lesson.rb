class Lesson < ActiveRecord::Base
  attr_accessible :content, :date, :description, :name
  has_many :codepens
end
