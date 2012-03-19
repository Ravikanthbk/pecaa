class CreateSiteContacts < ActiveRecord::Migration
  def change
    create_table :site_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.text :email
      t.text :phone
      t.integer :created_by
      t.integer :site_id
      t.boolean :is_active

      t.timestamps
    end
  end
end