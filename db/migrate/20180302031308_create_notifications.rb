class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :notifiable, polymorphic: true
      t.boolean :read, default: false
      t.integer :user_id
      t.timestamps
    end
  end
end
