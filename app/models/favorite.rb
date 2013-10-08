class Favorite < ActiveRecord::Base
  default_scope order('updated_at DESC')
  attr_accessible :codepen_id, :user_id
  belongs_to :codepen
  belongs_to :user
end
