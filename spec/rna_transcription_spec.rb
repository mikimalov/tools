RSpec.describe Tools::Rnatranscription do
  it 'can be empty RNA sequence if DNA is empty as well' do
    rna = Tools::Rnatranscription.new('')
    expect(rna.complement_nucleotide).to eq('')
  end

  it 'can be transformed from cytosine into guanine' do
    rna = Tools::Rnatranscription.new('C')
    expect(rna.complement_nucleotide).to eq('G')
  end

  it 'can be transformed from guanine into cytosine too' do
    rna = Tools::Rnatranscription.new('G')
    expect(rna.complement_nucleotide).to eq('C')
  end

  it 'can be transformed from thymine into adenine' do
    rna = Tools::Rnatranscription.new('T')
    expect(rna.complement_nucleotide).to eq('A')
  end

  it 'can be transformed from adenine into uracil' do
    rna = Tools::Rnatranscription.new('A')
    expect(rna.complement_nucleotide).to eq('U')
  end
end
