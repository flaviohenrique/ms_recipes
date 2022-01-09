class RecipeService
  include MsRecipes::Deps['recipes.repository']

  delegate :list_paged, :list_all, :get_by_id, to: :repository
end
