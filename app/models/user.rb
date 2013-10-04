class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :providers_attributes,
                  :first_name, :last_name, :country, :agrees
  
  has_many :providers, :class_name => "UserProvider", :dependent => :destroy
  has_many :events
  accepts_nested_attributes_for :providers

  authenticates_with_sorcery!

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  def name
    self.first_name + ' ' + self.last_name
  end
end
