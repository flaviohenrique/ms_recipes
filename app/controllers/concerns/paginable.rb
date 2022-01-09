module Paginable
  include Pagy::Backend

  def paginate_params
    Paginate.new(page: params[:page] || 1, per_page: params[:per_page] || 2)
  end

  def paginate_results(results)
    return [[], nil] if results.items.blank?

    [results.items, Pagy.new(count: results.count, page: results.page, items: results.per_page)]
  end
end
