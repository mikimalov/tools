RSpec.describe Tools::Acronym do
  it 'returns every first letter' do
    acronym = Tools::Acronym.new('Portable Network Graphics')
    expect(acronym.abbreviate).to eq('PNG')
  end

  it 'returns and capitalize every first letter' do
    acronym = Tools::Acronym.new('Ruby on Rails')
    expect(acronym.abbreviate).to eq('ROR')
  end

  it 'can remove punctuation between words' do
    acronym = Tools::Acronym.new('First In, First Out')
    expect(acronym.abbreviate).to eq("FIFO")
  end

  it 'can abbreviate, even if there are words with all caps letters' do
    acronym = Tools::Acronym.new('GNU Image Manipulation Program')
    expect(acronym.abbreviate).to eq("GIMP")
  end

  it 'can take every first letter, even from the words without spaces' do
    acronym = Tools::Acronym.new('Complementary metal-oxide semiconductor')
    expect(acronym.abbreviate).to eq("CMOS")
  end

  it 'can take every first letter, from long sentences' do
    acronym = Tools::Acronym.new('Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me')
    expect(acronym.abbreviate).to eq("ROTFLSHTMDCOALM")
  end

  it 'can take every first letter, even there is consecutive delimiters inside' do
    acronym = Tools::Acronym.new('Something - I made up from thin air')
    expect(acronym.abbreviate).to eq("SIMUFTA")
  end
end