 class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

   #

  # def show
  #   @recipe = Recipe.find(params[:id])
  # end

  def destroy
    @recipe.destroy
    redirect_to users_path
  end

  # private

  # def recipe_params_by_title
  #   params.require(:recipe).permit(:recipe)
  # end

  # def recipe_params_by_ingredients
  #   params.require(:recipe).permit(:ingredients)
  # end

  # def find_recipe(params)
  #   recipe = Recipe.new
  #   recipe.recipe_search(params)
  #   recipe_response = recipe.recipe(params)

  #   # @recipe = Recipe.find(params[:id])
  # end

  # def recipe_params
  #   params.require(:recipe).permit(:name)
  # end
end

