class ContentLibrary < ActiveRecord::Base
  belongs_to :source, :polymorphic => true
  has_and_belongs_to_many :sites
  
  scope :by_source_type, lambda{ |arg|
    where(:source_type => arg)  
  }
  scope :by_name, lambda{|arg|
    where("name like ?" , "%#{arg}%")
  }
  
#  def self.search(params)
#    method_mappings = { :source_type => :by_source_type, :name => :by_name}        
#    results = ContentLibrary.search()
#    params.each do |key,value|
#      results = results.send(method_mappings[key.to_sym],value) if method_mappings[key.to_sym] and not value.blank?
#    end
#    results
#  end
  
end
