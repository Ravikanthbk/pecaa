class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.text      :description
      t.string    :name
      t.integer   :created_by
      t.boolean   :is_active, :default => true
      t.string    :title

      t.timestamps
    end
    add_index :sites, :created_by
  end
end
