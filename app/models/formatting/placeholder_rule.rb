module Formatting
  class PlaceholderRule
    def initialize(placeholder:, replacement:)
      @placeholder = placeholder
      @replacement = replacement
    end

    def decorate(content)
      content.gsub(replacement_pattern) do |match|
        @replacement.call(match.delete(@placeholder))
      end
    end

    private

    def replacement_pattern
      /#{Regexp.quote(@placeholder)}(.*?)#{Regexp.quote(@placeholder)}/
    end
  end
end