class Lesson < ActiveRecord::Base
  default_scope order('date')
  scope :upcoming, where('date > ?', Time.now)
  scope :past, where('date < ?', Time.now)
  attr_accessible :content, :date, :description, :name, :user_id, :status
  has_many :codepens
  belongs_to :user

  def published?
    if self.status == "published"
      return true
    else
      return false
    end
  end
end
