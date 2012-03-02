class AddColumnToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :user_id, :integer
    add_column :videos, :is_deleted, :boolean, :default => false
  end
end
