class SiteLink < ActiveRecord::Base
  belongs_to :site
  
  validates_presence_of :name, :target
  validates_length_of :name, :maximum => 255 
  validates_length_of :description, :maximum => 1000
  
end
