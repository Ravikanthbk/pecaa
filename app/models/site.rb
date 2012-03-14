class Site < ActiveRecord::Base
  has_many :site_links, :dependent => :delete_all
  has_many :site_contacts, :dependent => :delete_all
  
  belongs_to :created_by, :class_name => "User", :foreign_key => "created_by"
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 255 
  validates_length_of :description, :maximum => 1000
  
end
