class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    p params
    @recipe = Recipe.create(params)
    @recipe_response = @recipe.query(params)
    # @recipe_title = Recipe.new(recipe_params_by_title)
    # @recipe_ingredients = Recipe.new(recipe_by_ingredients)
    if @recipe.save
      # current_user.recipe << @recipe
      redirect_to recipes_path
    else
      @errors = @recipe.errors.full_messages
      render :new
    end
  end

  # def show
  #   @recipe = Recipe.find(params[:id])
  # end

  def destroy
    @recipe.destroy
    redirect_to users_path
  end

  private

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

