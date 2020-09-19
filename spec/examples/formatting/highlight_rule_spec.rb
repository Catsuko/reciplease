require 'spec_helper'
require 'formatting/highlight_rule'
require 'support/shared_examples/formatting_examples'

RSpec.describe 'content formatted by a Highlight Rule,' do
  let(:placeholder) { '*' }
  let(:style) { 'bold' }

  subject { 
    Formatting::HighlightRule.new(
      placeholder: placeholder, style: style
    ).decorate(content) 
  }

  context 'given content that contains no placeholders,' do
    let(:content) { 'A cat sat on the mat.' }

    include_examples 'unapplied rule'
  end

  context 'given content contains a single placeholder,' do
    let(:content) { 'A cat sat on the *mat.'}

    include_examples 'unapplied rule'
  end

  context 'given content contains a set of placeholders,' do
    let(:highlighted_word) { 'mat' }
    let(:content) { "A cat sat on the #{placeholder}#{highlighted_word}#{placeholder}" }

    it 'the placeholders are removed' do
      expect(subject).not_to include(placeholder)
    end

    it 'the highlighted word is wrapped by a span element' do
      expect(subject).to match(/<span.*>#{highlighted_word}<\/span>/)
    end

    it 'the inserted element is styled' do
      expect(subject).to match(/<.* class=['"]#{style}['"]>/)
    end
  end
end