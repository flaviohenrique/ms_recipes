require 'contentful'
module Recipes
  class Repository
    attr_reader :client

    def initialize(client: nil, config: Rails.application.credentials.config, mapper: ::Recipes::Mapper.new)
      @mapper = mapper
      @client = client || Contentful::Client.new(
        space: config[:contentful][:space],
        access_token: config[:contentful][:access_token]
      )
    end

    def list_all
      @client.entries(content_type: 'recipe').map(&@mapper.method(:recipe_entry_to_entity))
    end

    def get_by_id(id)
      @client.entry(id, include: 1).then(&@mapper.method(:recipe_detail_to_entity))
    end
  end
end