module Recipes
  class RecipeDetail < RecipeEntry
    attr_accessor :tags,
                  :description,
                  :chef_name
  end
end
