require 'contentful'
require 'yaml'

class RecipesController < ApplicationController
  def index
    # TODO: Abstract contentful behind service returning viewmodel
    # TODO: React component for expanding previews
    formatting = Formatting::CompositeRule.new
    @recipes = client.entries(content_type: :recipe)
                     .map{ |entry| ContentfulRecipe.new(entry, formatting) }
  end

  private

  def client
    credentials = YAML.load_file(Rails.root.join('tmp', 'contentful_details.yml')).symbolize_keys
    client = Contentful::Client.new(**credentials)
  end
end