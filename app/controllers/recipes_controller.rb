class RecipesController < ApplicationController
  include Paginable
  include MsRecipes::Deps[:recipe_service]

  def index
    @recipes, @pagy = paginate_results(recipe_service.list_paged(paginate_params))
  end

  def show
    @recipe = recipe_service.get_by_id(params[:id])
  end
end
