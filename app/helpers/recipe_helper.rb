require 'github/markup'

module RecipeHelper
  def recipe_description_html(description)
    GitHub::Markup.render_s(GitHub::Markups::MARKUP_MARKDOWN, description).html_safe
  end
end
