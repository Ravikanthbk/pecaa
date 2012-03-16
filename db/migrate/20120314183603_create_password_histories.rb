class CreatePasswordHistories < ActiveRecord::Migration
  def change
    create_table :password_histories do |t|
      t.string :password
      t.integer :created_by
      t.integer :user_id

      t.timestamps
    end
  end
end
