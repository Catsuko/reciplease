require 'contentful'

module ContentfulCdn
  class RecipeService
    def initialize(space:, access_token:, formatting:)
      @space = space
      @access_token = access_token
      @formatting = formatting
    end

    def all
      client.entries(content_type: :recipe).map do |entry| 
        ContentfulCdn::Recipe.new(entry, @formatting)
      end
    end

    private

    def client
      Contentful::Client.new(space: @space, access_token: @access_token)
    end
  end
end