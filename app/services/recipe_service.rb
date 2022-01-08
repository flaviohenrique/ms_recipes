class RecipeService
  def initialize(repository = ::Recipes::Repository.new)
    @repository = repository
  end

  delegate :list_all, :get_by_id, to: :@repository
end
