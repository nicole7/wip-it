class RecipeAPI < ApplicationRecord
  inclide HTTParty
  # GIVE_JSON="Accept:application/json"
  BASE_URL="https://api.edamam.com/search?q=chicken&"
  API_PARTIAL_URL="app_id=#{ENV['RECIPE_API_ID']}&app_key=#{ENV['RECIPE_API_KEY']}&from=0&to=10&calories=gte%20591,%20lte%20722&health=alcohol-free"

  def query
    request = HTTParty.get(BASE_URL+@search_format+API_PARTIAL_URL).to_json
    @request_hash = JSON.parse(request)
  end

  def recipe_search(user_search_input)
    @search_format = "q=#{user_search_input.gsub(" ", "%20")}&"
  end

  # ENV['RECIPE_API_ID']
  # ENV['RECIPE_API_KEY']
end




  # curl "Accept:application/json" "https://api.edamam.com/search?q=chicken&app_id=${RECIPE_API_ID}&app_key=${RECIPE_API_KEY}&from=0&to=10&calories=gte%20591,%20lte%20722&health=alcohol-free"