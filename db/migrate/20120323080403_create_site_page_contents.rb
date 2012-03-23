class CreateSitePageContents < ActiveRecord::Migration
  def change
    create_table :site_page_contents do |t|
      t.integer :site_id
      t.integer :content_library_id
      t.string :name

      t.timestamps
    end
  end
end
