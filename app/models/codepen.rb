class Codepen < ActiveRecord::Base
  attr_accessible :note, :title, :url, :lesson_id, :user_id
  belongs_to :lesson
  belongs_to :user
  has_many :favorites
end
