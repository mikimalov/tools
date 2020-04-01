require "tools/version"

module Tools
  class Luhn
    def initialize(str)
      @str = str
    end

    def valid?
      return false if punctuation_rules? || luhn_sum == false
      true
    end

  private

    def reversed_strip
      reversed_strip = @str.delete(' ').reverse
    end

    def reversed_array
      reversed_strip.chars
    end

    def every_first_range
      (0..reversed_array.length-1).step(2).map { |i| reversed_array[i] }
    end

    def string_to_integer1
      every_first_range.map { |i| i.to_i}
    end

    def every_second_range
      (1..reversed_array.length-1).step(2).map { |i| reversed_array[i]}
    end

    def string_to_integer2
      every_second_range.map { |i| i.to_i}
    end

    def multiplying_number
      string_to_integer2.map { |i| ((i * 2)-9 if i >= 5) || i*2 }
    end

    def sum_all
      (multiplying_number + string_to_integer1).sum
    end

    def luhn_sum
      sum_all % 10 == 0
    end

    def punctuation_rules?
     @str.length <= 1 || @str.chars.any? { |char| ('a'..'z').include? char.downcase } || !@str.scan(/[!$&#-]/).empty? || @str.include?(':') || @str.length == 2 && @str[0] == ' ' && @str[1] == '0'
    end
  end

  class Fer
    def initialize(name)
      @name = name
    end

    def two_fer
      return "One for Alice, one for me." if @name == 'Alice'
      return "One for Bob, one for me." if @name == 'Bob'
      "One for you, one for me."
    end
  end

  class Acronym
    def initialize(acronym)
     @acr = acronym
    end

    def abbreviate
     first_letters_only
    end

  private

    def remove_punctuation
     @acr.sub('-', ' ')
    end

    def first_letters_only
     remove_punctuation.split.map { |i| i.chr}.join.upcase
    end
  end

  class Raindrops
    attr_reader :number

    def initialize(number)
      @number = number
      @string = ''
    end

    def speak
      do_math
    end

  private

    def do_math
      @string += 'Pling' if @number % 3 == 0
      @string += 'Plang' if @number % 5 == 0
      @string += 'Plong' if @number % 7 == 0
      @string.empty? ? @number.to_s : @string
    end
  end

  class Squares
    def initialize(number)
      @number = number
    end

    def square_of_sum
      (1..@number).sum ** 2
    end

    def sum_of_squares
      ((1..@number).map { |num| num**2 }).sum
    end

    def difference
      square_of_sum - sum_of_squares
    end
  end

  class Rnatranscription
    RNA = { 'G' => 'C',
      'C' => 'G',
      'T' => 'A',
      'A' => 'U'
    }
    def initialize(sequence)
      @seq = sequence
    end

    def complement_nucleotide
      @seq.chars.map { |nucl| RNA.fetch(nucl, '') }.join
    end
  end

  class Allergies
    LIMIT = 256
    ALLERGENS = {
      1 => 'eggs',
      2 => 'peanuts',
      4 => 'shellfish',
      8 => 'strawberries',
      16 => 'tomatoes',
      32 => 'chocolate',
      64 => 'pollen',
      128 => 'cats'
    }
    def initialize(score)
      @score = score
      @score -= LIMIT while @score >= LIMIT
    end

    def allergic_to?(allergen)
      allergens.include?(allergen)
    end

    def allergens
      score_allergens.map { |allergen| ALLERGENS[allergen] }
    end

    private

    def allergen_keys
      ALLERGENS.keys.select { | key | key <= @score }.sort.reverse
    end

    def score_allergens
      s = @score
      allergen_keys.select { |key| s >= key && s -= key }
    end
  end

  class Resistors
    RESISTOR = {
      black: {
          value: 0,
          multiplier: 1,
          tolerance:20
      },
      brown: {
          value: 1,
          multiplier: 10,
          tolerance: 1
      },
      red: {
          value: 2,
          multiplier: 100,
          tolerance: 2
      },
      orange: {
          value: 3,
          multiplier: 1_000,
          tolerance: 0.2
      },
      yellow: {
          value: 4,
          multiplier: 10_000,
          tolerance: 0.05
      },
      green: {
          value: 5,
          multiplier: 100_000,
          tolerance: 0.5
      },
      blue: {
          value: 6,
          multiplier: 1_000_000,
          tolerance: 0.25
      },
      violet: {
          value: 7,
          multiplier: 10_000_000,
          tolerance: 0.10
      },
      gray: {
          value: 8,
          multiplier: 100_000_000,
          tolerance: 0.05
      },
      white: {
          value: 9,
          multiplier: 1_000_000_000,
          tolerance: 10
      },
      gold: {
          value: 0,
          multiplier: 0.10,
          tolerance: 5
      },
      silver: {
          value: 0,
          multiplier: 0.10,
          tolerance: 10
      },
    }

    def initialize(color)
      @color1, @color2, @multiplier, @tolerance = color
    end

    def specification
      "#{multiplier} ohms +/-#{tolerance}%"
    end

    def resistor_values
      color_values
    end

    private

    def delete_punctation
      colors.to_s.delete("0")
    end

    def tolerance
      @tolerance.nil? ? 20 : RESISTOR[@tolerance][:tolerance]
    end

    def colors
      RESISTOR[@color1][:value]*10 + RESISTOR[@color2][:value]
    end

    def color_values
      delete_punctation.length < 2 ? (delete_punctation.to_i)*10 + RESISTOR[@multiplier][:value ]: colors
    end

    def multiplier
      colors * RESISTOR[@multiplier][:multiplier]
    end
  end
end
