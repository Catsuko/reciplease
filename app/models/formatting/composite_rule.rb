module Formatting
  class CompositeRule
    def initialize(rules=[])
      @rules = rules
    end

    def decorate(content)
      @rules.reduce(content){|result, rule| rule.decorate(result) }
    end
  end
end