RSpec.describe Tools::Chocolate do
  it 'returns true if both people have one piece of chocolate which has same size' do
    chocolate = Tools::Chocolate.new([[3,2]], [[3,2]])
    expect(chocolate.fairness?).to be true
  end

  it 'returns false if both pieces of chocolate have different size' do
    chocolate = Tools::Chocolate.new([[4, 3]], [[6, 3]])
    expect(chocolate.fairness?).to be false
  end

  it 'returns true if two people have chocolate with same chocolate area' do
    chocolate = Tools::Chocolate.new([[4, 3], [2, 4], [1, 2]], [[6, 2], [4, 2], [1, 1], [1, 1]])
    expect(chocolate.fairness?).to be true
  end

  it 'returns false if chocolates which belong to different people have different area' do
    chocolate = Tools::Chocolate.new([[1, 3], [3, 4], [2, 2]], [[8, 2], [1, 7]])
    expect(chocolate.fairness?).to be false
  end
end