class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.boolean :approved, default: false
    end
  end
end
