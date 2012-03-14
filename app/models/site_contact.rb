class SiteContact < ActiveRecord::Base
  belongs_to :site
  belongs_to :created_by, :class_name => "User", :foreign_key => "created_by"
  
  def name=(name)
    na = name.split(' ')
    self.first_name = na.pop
    self.last_name = na.join(' ')
  end
  
  def name
    "#{self.first_name} #{self.last_name}"
  end
end
