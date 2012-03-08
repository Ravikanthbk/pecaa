class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :sub_permissions

  validates :name, :presence => true, :uniqueness => true

end