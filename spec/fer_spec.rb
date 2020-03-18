RSpec.describe Tools::Fer do
  it 'returns one for you, one for me when no name given' do
    fer = Tools::Fer.new('no_name')
    expect(fer.two_fer).to eq("One for you, one for me.")
  end

  it 'returns one for Alice, one for me when name Alice given' do
    fer = Tools::Fer.new('Alice')
    expect(fer.two_fer).to eq("One for Alice, one for me.")
  end

  it 'returns one for Bob, one for me when name Bob given' do
    fer = Tools::Fer.new('Bob')
    expect(fer.two_fer).to eq("One for Bob, one for me.")
  end
end