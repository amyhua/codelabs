class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :providers_attributes,
                  :first_name, :last_name, :codepen_username, :image
  attr_protected :admin
  has_many :providers, :class_name => "UserProvider", :dependent => :destroy
  has_many :codepens
  has_many :favorites
  has_many :questions
  has_many :answers
  accepts_nested_attributes_for :providers

  authenticates_with_sorcery!

  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :codepen_username
  validates_uniqueness_of :email
  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  def name
    self.first_name + ' ' + self.last_name
  end

  def favorite(codepen)
    favorite = Favorite.create!(user_id: self.id, codepen_id: codepen.id)
  end

  def unfavorite(codepen)
    self.favorites.where(codepen_id: codepen.id).first.destroy
  end

  def favorited?(codepen)
    self.favorites.any? {|f| f.codepen == codepen}
  end

  def favorite_codepens
    codepens = []
    for fave in self.favorites
      codepens.push(fave.codepen)
    end
    return codepens
  end

end
