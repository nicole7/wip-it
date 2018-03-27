class SearchRecipe
  BASE_URL="https://api.edamam.com/search?"

  def query(search_term)
    query_api(search_term)
    parse_response
  end

  def parse_response
    @response["hits"]&.map do |hit|
      api_recipe = hit["recipe"]
      Recipe.find_or_create_by(uri: api_recipe["uri"]) do |recipe|
        [:label, :image, :source, :url, :cautions, :tags, :calories].each do |f|
          recipe.send("#{f}=", api_recipe[f.to_s])
        end
        recipe.ingredientLines = api_recipe["ingredientLines"]&.join("\n")
      end
    end
  end

  def query_api(search_term)
    q = {app_id: ENV['RECIPE_API_ID'], app_key: ENV['RECIPE_API_KEY'], from: 0, to: 10, q: search_term}.to_query
    @response = HTTParty.get(BASE_URL+q)
  end
end


