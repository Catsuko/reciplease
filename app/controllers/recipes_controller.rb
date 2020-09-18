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
      Formatting::PlaceholderRule.new(
        placeholder: '*',
        replacement: Proc.new{ |match| "<span class='hot-pink b'>#{match}</span>" }
      ),
      Formatting::PlaceholderRule.new(
        placeholder: '__',
        replacement: Proc.new{ |match| "<span class='blue'>#{match}</span>" }
      ),
    ])
  end
end