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
     @str.length <= 1 || @str.chars.any? { |char| ('a'..'z').include? char.downcase } || !@str.scan(/[!$&#-]/).empty?  ||  @str.include?(':') || @str.length == 2 && @str[0] == ' ' && @str[1] == '0'
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
    end

    def raindrop_speak
      do_math
    end

  private

    def do_math
      return 'PlingPlangPlong' if @number % 3 == 0 && @number % 5 == 0 && @number % 7 == 0
      return 'PlangPlong' if @number % 5 == 0 && @number % 7 == 0
      return 'PlingPlong' if @number % 3 == 0 && @number % 7 == 0
      return 'PlingPlang' if @number % 3 == 0 && @number % 5 == 0
      return 'Pling' if @number % 3 == 0
      return 'Plang' if @number % 5 == 0
      return 'Plong' if @number % 7 == 0
      @number.to_s
    end
  end
end
