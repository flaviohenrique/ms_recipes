require 'contentful'
module Recipes
  class Repository
    include MsRecipes::Deps[mapper: 'recipes.mapper', client: 'contentful.client']

    def list_all
      client.entries(content_type: 'recipe').map(&mapper.method(:recipe_entry_to_entity))
    end

    def get_by_id(id)
      client.entry(id, include: 1).then(&mapper.method(:recipe_detail_to_entity))
    end
  end
end