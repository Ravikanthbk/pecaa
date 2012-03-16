class CreateBaseColors < ActiveRecord::Migration
  def change
    create_table :base_colors do |t|
      t.text :colors
      t.string :name
      t.integer :created_by

      t.timestamps
    end
  end
end
