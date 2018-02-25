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

      t.timestamps
    end
  end
end

# curl "Accept:application/json" "https://api.edamam.com/search?q=chicken&app_id=6ebce0bc&app_key=4c628a09c021275c9545f44c0837f0ae&from=0&to=10&calories=gte%20591,%20lte%20722&health=alcohol-free"



