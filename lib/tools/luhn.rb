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
end