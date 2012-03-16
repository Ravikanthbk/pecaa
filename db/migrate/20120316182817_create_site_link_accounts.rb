class CreateSiteLinkAccounts < ActiveRecord::Migration
  def change
    create_table :site_link_accounts do |t|
      t.integer   :site_id
      t.integer   :user_id
      t.integer   :created_by
      t.string    :access
      t.text      :access_level
      t.boolean   :is_active, :default => true

      t.timestamps
    end
  end
end
