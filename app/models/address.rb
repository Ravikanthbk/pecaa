class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :site
  belongs_to :created_by, :class_name => "User", :foreign_key => "created_by" 
end