class Favorite < ActiveRecord::Base
  attr_accessible :codepen_id, :user_id
  belongs_to :codepen
  belongs_to :user
end
