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
     'black' => '0',
     'brown' => '1',
     'red' => '2',
     'orange' => '3',
     'yellow' => '4',
     'green' => '5',
     'blue' => '6',
     'violet' => '7',
     'gray' => '8',
     'white' => '9',
     'gold' => '-' ,
     'silver' => '-'
    }

    def initialize(color1, color2, color3)
      @color1 = color1
      @color2 = color2
      @color3 = color3
    end

    def resistor_values
     values.to_i
    end

    private

    def color_values
      (RESISTOR[@color1] + RESISTOR[@color2]).delete('0').delete('-')
    end

    def values
      color_values.length < 2 ? color_values + RESISTOR[@color3] : color_values
    end
  end
end
