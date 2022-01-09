class PaginatedResult
  include ActiveModel::API

  attr_accessor :count, :page, :per_page, :items
end
