require 'contentful'
module Recipes
  class Repository
    include MsRecipes::Deps[mapper: 'recipes.mapper', client: 'contentful.client']

    def list_paged(page_params = ::Paginate.default)
      client_recipes(page_params.to_limit).then do |results|
        PaginatedResult.new(
          count: results.total,
          page: page_params.page,
          per_page: page_params.per_page,
          items: results.map(&mapper.method(:recipe_entry_to_entity))
        )
      end
    end

    def list_all
      client_recipes.map(&mapper.method(:recipe_entry_to_entity))
    end

    def get_by_id(id)
      client.entry(id, include: 1).then(&mapper.method(:recipe_detail_to_entity))
    end

    private

    def client_recipes(params = {})
      client.entries(params.merge(content_type: 'recipe'))
    end
  end
end
