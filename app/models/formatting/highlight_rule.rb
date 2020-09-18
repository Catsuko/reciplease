module Formatting
  class HighlightRule
    TEMPLATE = "<span class='%s'>%s</span>".freeze


    def initialize(placeholder:, style:)
      @placeholder = placeholder
      @style = style
    end

    def decorate(content)
      content.gsub(replacement_pattern) do |match|
        TEMPLATE % [@style, match.delete(@placeholder)]
      end
    end

    private

    def replacement_pattern
      /#{Regexp.quote(@placeholder)}(.*?)#{Regexp.quote(@placeholder)}/
    end
  end
end