module Formatting
  class HighlightRule
    def initialize(placeholder:, style:)
      @placeholder = placeholder
      @style = style
    end

    def decorate(content)
      content.gsub(replacement_pattern, styled_template)
    end

    private

    def styled_template
      @styled_template ||= "<span class='#{@style}'>\\1</span>".freeze
    end

    def replacement_pattern
      @pattern ||= /#{Regexp.quote(@placeholder)}(.*?)#{Regexp.quote(@placeholder)}/
    end
  end
end