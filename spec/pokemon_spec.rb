RSpec.describe Tools::Pokemon do
  it 'can calculate damage between different pokemons with same power' do
    pokemon = Tools::Pokemon.new("grass","water",35,35)
    expect(pokemon.calculate_damage).to eq 100
  end

  it 'can calculate damage between different pokemons with different power too' do
    pokemon = Tools::Pokemon.new("electric","water",100,50)
    expect(pokemon.calculate_damage).to eq 200
  end

  it 'can calculate different damage if opposite (electric is more effective than water)' do
    pokemon = Tools::Pokemon.new("water","electric",100,50)
    expect(pokemon.calculate_damage).to eq 50
  end

  it 'can show that damage between two pokemons of a same kind is always 0' do
    pokemon = Tools::Pokemon.new("fire","fire",100,100)
    expect(pokemon.calculate_damage).to eq 0
  end
end