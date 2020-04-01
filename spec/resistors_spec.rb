RSpec.describe Tools::Resistors do
  describe 'resistor should return only two digit number ' do
    it 'takes all colors if there are only two colors given' do
     resistor = Tools::Resistors.new([:green, :yellow])
     expect(resistor.resistor_values). to eq 54
    end

    it 'should return two digits, even there are three colors given' do
      resistor = Tools::Resistors.new([:blue, :green, :orange, :red])
      expect(resistor.resistor_values). to eq 65
    end

    it 'doesn\' put 0 as output and takes third color, if first or second is black' do
     resistor = Tools::Resistors.new([:green, :black, :orange])
     expect(resistor.resistor_values). to eq 53
    end

    it 'should return two digit number, even there are four colors given' do
      resistor = Tools::Resistors.new([:red, :black, :orange, :purple])
      expect(resistor.resistor_values). to eq 23
    end

    it "puts 0 like second digit, if two of all given colors have value 0" do
     resistor = Tools::Resistors.new([:gold, :blue, :silver])
     expect(resistor.resistor_values). to eq 60
    end
  end

  describe 'specifications of every resistor' do
    it 'can take first two colors, multiply with third one, and show tolerance by default(20%), if not given' do
     resistor = Tools::Resistors.new([:green, :blue, :white])
     expected = "56000000000 ohms +/-20%"
     expect(resistor.specification). to eq expected
    end

    it 'can take two color values , multiply with third one and show tollerance of the last forth color' do
     resistor = Tools::Resistors.new([:red , :red , :green, :green])
     expected = "2200000 ohms +/-0.5%"
     expect(resistor.specification). to eq expected
    end

    it 'can show that resistor has not power at all, if there are color values 0' do
      resistor = Tools::Resistors.new([:black , :gold , :green, :orange])
      expected = "0 ohms +/-0.2%"
      expect(resistor.specification). to eq expected
    end
  end
end