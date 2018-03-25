require 'json'

class Recipe < ApplicationRecord

  include HTTParty

  belongs_to :user


  has_many :likes, as: :likable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  # GIVE_JSON="Accept:application/json"
  BASE_URL="https://api.edamam.com/search"


  API_PARTIAL_URL="app_id=#{ENV['RECIPE_API_ID']}&app_key=#{ENV['RECIPE_API_KEY']}&from=0&to=10"

  def query(user_search_input)
    request = HTTParty.get(BASE_URL+self.recipe_search(user_search_input)+API_PARTIAL_URL).to_json
    @request_hash = JSON.parse(request)
  end

  def recipe_search(user_search_input)
    @search_format = "?q=#{user_search_input["name"].gsub(" ", "%20")}&"
  end

  # ENV['RECIPE_API_ID']
  # ENV['RECIPE_API_KEY']
end


# nicole = User.create(first_name: "Nicole", last_name: "Gasperini", email: "nicole@nicole.com", password: "boo")


# Recipe.create(id: 1, recipe: "Something", uri: "hey", label: "food", image: "image_string", source: "hey", tags: "hey", ingredientLines: "hey", ingredients: "Hey", calories: "12", totalWeight: "12", totalNutrients: "12", bookarked: false, bought: true)