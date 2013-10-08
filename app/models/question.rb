class Question < ActiveRecord::Base
  default_scope order('updated_at DESC')
  attr_accessible :detail, :name, :user_id
  belongs_to :user
  has_many :answers, dependent: :delete_all
end
