RSpec.describe Tools::Antipodes do
  it 'returns smaller arrays than input array' do
    antipodes = Tools::Antipodes.new([1,2,3,4])
    expect(antipodes.array_sum).to eq [5,5]
  end
  it 'split the array into smaller parts of equal length, even if array number is odd' do
    antipodes = Tools::Antipodes.new([1,2,3,4,5])
    expect(antipodes.array_split).to eq [[1, 2], [4, 5]]
  end
  it 'sum each number of the first part with each number of the second part' do
    antipodes = Tools::Antipodes.new([1,2,3,4,6,7,8,9])
    expect(antipodes.array_sum).to eq [10,10]
  end
  it 'devide by 2 each number in the final array' do
    antipodes = Tools::Antipodes.new([1,2,3,4])
    expect(antipodes.devide).to eq [2.5, 2.5]
  end
  it 'can do same math with negative numbers' do
    antipodes = Tools::Antipodes.new([1,-2,3,4,-5])
    expect(antipodes.devide).to eq [-2, 1]
  end
end