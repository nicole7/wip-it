class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :recipe_name
      t.string :label
      t.string :ingredientLines
      t.string :ingredients
      t.integer :favorite
      t.integer :user_id
      t.timestamps
    end
  end
end
