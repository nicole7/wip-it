class RecipesController < ApplicationController
  def new
  end

  def create
    @recipe = Recipe.create(user: current_user)
    recipe_response = recipe_search(params)
  end

  def show
  end

  def destroy
  end

  def updated
  end

end