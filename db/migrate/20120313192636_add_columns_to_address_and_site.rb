class AddColumnsToAddressAndSite < ActiveRecord::Migration
  def change
    add_column :addresses, :type, :string
    add_column :addresses, :site_id, :integer
    add_column :addresses, :created_by, :integer
  end
end
