RSpec.shared_examples 'unapplied rule' do
  it 'no changes are made' do
    expect(subject).to eq content
  end
end

RSpec.shared_examples 'with styled element' do
  it 'the inserted element is styled' do
    expect(subject).to match(/<.*class=['"]#{style}['"].*>/)
  end
end