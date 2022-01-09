module Recipes
  class Mapper
    def recipe_detail_to_entity(recipe)
      RecipeDetail.new(
        id: recipe.id,
        title: recipe.title,
        image_url: recipe.photo.url(width: 300, height: 300, quality: 100),
        description: recipe.description,
        tags: (recipe.fields.include?(:tags) && recipe.tags.map(&:name)) || [],
        chef_name: (recipe.fields.include?(:chef) && recipe.chef.name) || nil
      )
    end

    def recipe_entry_to_entity(recipe)
      RecipeEntry.new(
        id: recipe.id,
        title: recipe.title,
        image_url: recipe.photo.url(width: 300, height: 300, quality: 100)
      )
    end
  end
end
