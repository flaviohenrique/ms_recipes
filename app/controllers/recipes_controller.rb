class RecipesController < ApplicationController
  def service
    @service ||= RecipeService.new
  end

  def index
    @recipes = service.list_all
  end

  def show
    @recipe = service.get_by_id(params[:id])
  end
end
