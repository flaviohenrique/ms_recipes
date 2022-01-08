class RecipesController < ApplicationController
  include MsRecipes::Deps[:recipe_service]

  def index
    @recipes = recipe_service.list_all
  end

  def show
    @recipe = recipe_service.get_by_id(params[:id])
  end
end
