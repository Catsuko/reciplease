module Formatting
  class LinkRule
    def initialize(style:)
      @style = style
    end

    def decorate(content)
      content.gsub(/(\[.*\])?\s?\((.*)\)/, styled_template)
    end

    private

    def styled_template
      @styled_template ||= "<a class='#{@style}' href='\\2'>\\1</a>".freeze
    end
  end
end