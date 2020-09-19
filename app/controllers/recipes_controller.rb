class RecipesController < ApplicationController
  def index
    @recipes = recipe_service.all
  end

  private

  def recipe_service
    ContentfulCdn::RecipeService.new(
      space: 'kk2bw5ojx476',
      access_token: '7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c',
      formatting: formatting_rules
    )
  end

  def formatting_rules
    Formatting::CompositeRule.new([
      Formatting::HighlightRule.new(
        placeholder: '*',
        style: 'hot-pink b'
      ),
      Formatting::HighlightRule.new(
        placeholder: '__',
        style: 'blue'
      ),
      Formatting::LinkRule.new(
        style: 'blue underline dim'
      )
    ])
  end
end