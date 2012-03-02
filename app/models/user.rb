class User < ActiveRecord::Base
  
  has_and_belongs_to_many :roles
  has_many :images
  has_many :addresses
   
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
#  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  validates :email, :presence => true, :uniqueness => true
  validates :username, :presence => true
#  validates :password, :presence => true
  
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
  
  def addresses=address
    self.addresses.destroy_all
    self.addresses.new(address)
  end
end
