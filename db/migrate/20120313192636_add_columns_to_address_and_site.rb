class AddColumnsToAddressAndSite < ActiveRecord::Migration
  def change
    add_column :addresses, :country, :string
    add_column :addresses, :type, :string
    add_column :addresses, :site_id, :integer
    add_column :addresses, :created_by, :integer
    
    add_column :sites, :domain_name, :string
    add_column :sites, :company_name, :string

    add_index :sites, :domain_name
    add_index :sites, :name
    add_index :addresses, :created_by
    add_index :addresses, :site_id
  end
end
