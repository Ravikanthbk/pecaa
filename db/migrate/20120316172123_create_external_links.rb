class CreateExternalLinks < ActiveRecord::Migration
  def change
    create_table :external_links do |t|
      t.string  :name
      t.string  :link_url
      t.string  :target
      t.timestamps
    end
  end
end
