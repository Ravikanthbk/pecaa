class Site < ActiveRecord::Base
  has_many :site_links, :dependent => :delete_all
  has_many :site_contacts
  has_many :site_pages
  has_many :site_page_contents
  has_many :site_link_accounts
  has_one  :address
  has_and_belongs_to_many :content_libraries
  
  belongs_to :created_by, :class_name => "User", :foreign_key => "created_by"
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :site_contacts, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 255 
  validates_length_of :description, :maximum => 1000

  
end
