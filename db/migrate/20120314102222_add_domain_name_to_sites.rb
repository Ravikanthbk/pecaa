class AddDomainNameToSites < ActiveRecord::Migration
  def self.up
#    add_column "sites", "domain_name", :string
  end

  def self.down
    remove_column "sites", "domain_name"
  end
end
