class CreateSiteContacts < ActiveRecord::Migration
  def self.up
    create_table :site_contacts do |t|
      t.integer :site_id
      t.string :name
      t.string :position
      t.string :email
      t.string :phone
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :site_contacts
  end
end
