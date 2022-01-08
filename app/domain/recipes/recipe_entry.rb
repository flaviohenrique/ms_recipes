module Recipes
  class RecipeEntry
    include ActiveModel::API

    attr_accessor   :id,
                    :title,
                    :image_url
  end
end
