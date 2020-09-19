RSpec.shared_examples 'unapplied rule' do
  it 'no changes are made' do
    expect(subject).to eq content
  end
end