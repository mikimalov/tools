RSpec.describe Tools::Odd_number do
  it 'is always an Integer ' do
    number = Tools::Odd_number.new([1, 1, 2, -2, 5, 2, 4, 4, -2, -1, 5, 5])
    expect(number.one_number).to be_instance_of Integer
  end

  it 'shows only first number that appears odd number of times, even there are more like that' do
    number = Tools::Odd_number.new([1, 6, 1, 2, -2, 5, 2, -2, -1, 5, 5, 7])
    expect(number.one_number).to eq 6
  end

  it 'shows same number, if array has only one number inside' do
    number = Tools::Odd_number.new([8])
    expect(number.one_number).to eq 8
  end

  it 'can work propertly with negative numbers too' do
    number = Tools::Odd_number.new([-10])
    expect(number.one_number).to eq -10
  end

  it 'shows number that appears odd number of times in array' do
    number = Tools::Odd_number.new([1, 1, 2, -2, 5, 2, 4, 4, -2, -1, 5, 5])
    expect(number.all_numbers).to eq [-1]
  end

  it 'shows all numbers that appears odd number of times, even there are more like that' do
    number = Tools::Odd_number.new([1, 1, 2, -2, 5, 2, -2, -1, 5, 5, 6, 7])
    expect(number.all_numbers).to eq [-1, 6, 7]
  end

  it 'returns all numbers from an array, if there are not repetitive ones inside' do
    number = Tools::Odd_number.new([1, 2, 3, 4, 5])
    expect(number.all_numbers).to eq [1, 2, 3, 4, 5]
  end
end