class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :content
      t.string :path
      t.boolean :read, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
