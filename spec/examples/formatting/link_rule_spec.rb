require 'spec_helper'
require 'formatting/link_rule'
require 'support/shared_examples/formatting_examples'

RSpec.describe 'content formatted by a Link Rule,' do
  let(:style) { 'blue dim' }
  let(:link) { 'www.google.com' }
  let(:link_text) { 'SEARCH' }

  subject { Formatting::LinkRule.new(style: style).decorate(content) }

  context 'given content that contains no links,' do
    let(:content) { 'There is no spoon.' }

    include_examples 'unapplied rule'
  end

  context 'given content contains link text without a url,' do
    let(:content) { "There is no spoon. [#{link_text}]"}

    include_examples 'unapplied rule'
  end

  context 'given content contains link text with a url,' do
    let(:content) { "There is no spoon. [#{link_text}] (#{link})" }

    it 'the url is removed from the visible content' do
      expect(subject).not_to match(/\(#{link}\)/)
    end

    it 'the link text is not removed from the content' do
      expect(subject).to include(link_text)
    end

    it 'an anchor element is inserted around the link text' do
      expect(subject).to match(/<a.*>\[#{link_text}\]<\/a>/)
    end

    it 'the anchor element href is set to the link url' do
      expect(subject).to match(/<a.* href=['"]#{link}['"]>/)
    end

    include_examples 'with styled element'
  end
end