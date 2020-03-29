RSpec.describe Tools::Squares do
  it 'can show square of sum of one number' do
    s = Tools::Squares.new(1)
    expect(s.square_of_sum).to eq(1)
  end

  it 'can show square of sum of five consecutive numbers' do
    s = Tools::Squares.new(5)
    expect(s.square_of_sum).to eq(225)
  end

  it 'can show square of sum of more than five consecutive numbers' do
    s = Tools::Squares.new(100)
    expect(s.square_of_sum).to eq(25502500)
  end

  it'can show sum of squares of one number' do
    s = Tools::Squares.new(1)
    expect(s.sum_of_squares).to eq(1)
  end

  it 'can show sum of squares of five consecutive numbers' do
    s = Tools::Squares.new(5)
    expect(s.sum_of_squares).to eq(55)
  end

  it 'can show sum of squares of more than 5 consecutive numbers' do
    s = Tools::Squares.new(100)
    expect(s.sum_of_squares).to eq(338350)
  end

  it 'can make difference between square of sum and sum of squares, of one number' do
    s = Tools::Squares.new(1)
    expect(s.difference).to eq(0)
  end

  it 'can make difference between square of sum and sum of squares, of 5 consecutive numbers' do
    s = Tools::Squares.new(5)
    expect(s.difference).to eq(170)
  end

  it 'can make difference between square of sum and sum of squares, of more than 5 consecutive numbers' do
    s = Tools::Squares.new(100)
    expect(s.difference).to eq(25164150)
  end
end