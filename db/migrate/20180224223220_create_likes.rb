class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :recipe, foreign_kay: true
      t.references :user, foreign_key: true
      t.integer :count, default: 0
      t.timestamps null: false
    end
  end
end
