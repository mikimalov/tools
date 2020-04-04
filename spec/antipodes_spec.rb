RSpec.describe Tools::Antipodes do
  it 'returns smaller array, than input array' do
    antipodes = Tools::Antipodes.new([1,2,3,4,5])
    expect(antipodes.numbers?).to eq [3, 3]
  end

  it 'devides each number in the final array with 2' do
    antipodes = Tools::Antipodes.new([1,2,3])
    expect(antipodes.numbers?).to eq [2, 2]
  end

  it 'can return floating point if result by deviding is a floating point number' do
    antipodes = Tools::Antipodes.new([1,2,3,4])
    expect(antipodes.numbers?).to eq [2.5, 2.5]
  end

  it 'returns array with two numbers even if input array has more than 5 numbers' do
    antipodes = Tools::Antipodes.new([1,2,3,4,6,7,8,9])
    expect(antipodes.numbers?).to eq [5,5]
  end

  it 'can do same math, with negative numbers too' do
    antipodes = Tools::Antipodes.new([1,-2,3,4,-5])
    expect(antipodes.numbers?).to eq [-2, 1]
  end

  it 'returns same number if input array has only one number' do
    antipodes = Tools::Antipodes.new([9])
    expect(antipodes.numbers?).to eq 9
  end

  it 'returns sum of both numbers if input array has only two numbers' do
    antipodes = Tools::Antipodes.new([9, 6])
    expect(antipodes.numbers?).to eq 15
  end
end