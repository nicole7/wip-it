class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :label
      t.string :cautions
      t.string :ingredientLines
      t.string :ingredients
      t.string :totalNutrients
      t.boolean :bookmarked
      t.integer :user_id
      t.timestamps
    end
  end
end
