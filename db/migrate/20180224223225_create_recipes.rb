class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :recipe
      t.string :uri
      t.string :label
      t.string :image
      t.string :source
      t.string :url
      t.string :shareAs
      t.string :yield
      t.string :dietLabels
      t.string :cautions
      t.string :tags
      t.string :ingredientLines
      t.string :ingredients
      t.string :calories
      t.string :totalWeight
      t.string :totalNutrients
      t.boolean :bookarked
      t.boolean :bought
      t.integer :user_id
      t.timestamps
    end
  end
end





