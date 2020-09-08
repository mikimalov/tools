RSpec.describe Tools::Pokemondamage do
  it 'can calculate damage between different pokemons with same power' do
    pokemon = Tools::Pokemondamage.new("grass","water",35,35)
    expect(pokemon.damage).to eq 100
  end

  it 'can calculate damage between different pokemons with different power too' do
    pokemon = Tools::Pokemondamage.new("electric","water",100,50)
    expect(pokemon.damage).to eq 200
  end

  it 'can calculate different damage if opposite (electric is more effective than water)' do
    pokemon = Tools::Pokemondamage.new("water","electric",100,50)
    expect(pokemon.damage).to eq 50
  end

  it 'can show that damage between two pokemons of a same kind is always 0' do
    pokemon = Tools::Pokemondamage.new("fire","fire",100,100)
    expect(pokemon.damage).to eq 0
  end
end