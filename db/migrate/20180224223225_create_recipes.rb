class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :uri, index: true
      t.string :label
      t.string :image
      t.string :source
      t.string :url
      t.string :shareAs
      t.string :dietLabels
      t.string :cautions
      t.string :tags
      t.string :ingredientLines
      t.string :calories
      t.integer :favorite
      t.boolean :bookmarked
      t.boolean :bought
      t.integer :user_id
      t.timestamps
    end
  end
end







