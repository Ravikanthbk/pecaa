class CreateSiteCompanyInfos < ActiveRecord::Migration
  def self.up
    create_table :site_company_infos do |t|
      t.integer :site_id
      t.string :company_name
      t.text :address_1
      t.text :address_2
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :site_company_infos
  end
end
