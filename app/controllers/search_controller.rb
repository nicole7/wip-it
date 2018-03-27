class SearchController < ApplicationController
  def index
    if params[:query]
      @recipes = SearchRecipe.new.query(params[:query])
      puts params[:query]
    end
    render 'index'

  end

end