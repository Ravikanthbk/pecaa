class ContentLibrarySite < ActiveRecord::Migration
  def change
    create_table :content_libraries_sites, :id => false do |t|
      t.integer :content_library_id
      t.integer :site_id
    end
  end
end
