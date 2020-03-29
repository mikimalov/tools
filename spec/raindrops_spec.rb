RSpec.describe Tools::Raindrops do
  it 'should be an integer' do
    raindrops = Tools::Raindrops.new(11)
    expect(raindrops.number).to be_a(Integer)
  end
  it 'should return a string' do
    raindrops = Tools::Raindrops.new(11)
    expect(raindrops.speak).to be_a(String)
  end

  it "can do 'Pling' if  number has 3 as factor" do
    raindrops = Tools::Raindrops.new(6)
    expect(raindrops.speak).to eq('Pling')
  end

  it "can do 'Plang' if number has 5 as factor" do
    raindrops = Tools::Raindrops.new(10)
    expect(raindrops.speak).to eq('Plang')
  end

  it "can do 'Plong' if number has 7 as factor" do
    raindrops = Tools::Raindrops.new(7)
    expect(raindrops.speak).to eq('Plong')
  end

  it "can do 'PlingPlang' if given number is devided with 3 and 5" do
    raindrops = Tools::Raindrops.new(30)
    expect(raindrops.speak).to eq('PlingPlang')
  end

  it "can do 'PlangPlong' if given number is devided with 5 and 7" do
    raindrops = Tools::Raindrops.new(35)
    expect(raindrops.speak).to eq('PlangPlong')
  end

  it "can do 'PlingPlong' if there is number which can be devided with both 3 and 7" do
    raindrops = Tools::Raindrops.new(21)
    expect(raindrops.speak).to eq('PlingPlong')
  end

  it 'can return same number if that number can\'t be devided with 3,5 or 7' do
    raindrops = Tools::Raindrops.new(34)
    expect(raindrops.speak).to eq('34')
  end

  it "can do 'PlingPlangPlong' if there is number which can be devided with 3, 5 and 7" do
    raindrops = Tools::Raindrops.new(105)
    expect(raindrops.speak).to eq('PlingPlangPlong')
  end
end