class User < ActiveRecord::Base
  
  has_and_belongs_to_many :roles
  has_many :sites
  has_many :images
  has_many :addresses
  belongs_to :created_by, :class_name => "User", :foreign_key => "created_by"
  has_many :password_histories

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
#  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  validates :email, :presence => true, :uniqueness => true
  validates :username, :presence => true
  validates :password, :presence => true, :length => { :in => 6..30 }, :format => { :with => /^.*(?=.{6,})(?=.*[a-z])(?=.*[A-Z]).*$/ }
  
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
  
  def addresses=address
    self.addresses.destroy_all
    self.addresses.new(address)
  end
  
  before_save do |user|
#    if user.password_changed?
#    else
#      
#    end
  end
end
