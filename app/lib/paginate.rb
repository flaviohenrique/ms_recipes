class Paginate
  include ActiveModel::API

  attr_accessor :page, :per_page

  def to_limit
    { skip: ((page.to_i - 1) * per_page.to_i), limit: per_page }
  end

  def self.default
    new(page: 1, per_page: 100)
  end
end
