class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name
      t.integer :base_color_id
      t.string :theme_type
      t.text :css_style
      t.integer :created_by

      t.timestamps
    end
  end
end
