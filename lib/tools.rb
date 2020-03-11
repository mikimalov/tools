require "tools/version"

module Tools
  class Luhn
    def initialize(str)
      @str = str
      @array = [1..9]
    end

    def valid?
      return false if @str.length <= 1
      return false if @str.chars.any? { |char| ('a'..'z').include? char.downcase }
      return false if @str.length == 2 && @str[0] == ' ' && @str[1] == '0'
      return false if !@str.scan(/[!$&#-]/).empty?  ||  @str.include?(':')
      return false if luhn_valid? == false
      true
    end

  private

    def luhn_valid?
      stripped = @str.delete(' ')
      reversed_strip = stripped.reverse
      reversed_array = reversed_strip.chars
      every_first_range = (0..reversed_array.length-1).step(2)
      every_second_range = (1..reversed_array.length-1).step(2)
      every_first_array = every_first_range.map { |i| reversed_array[i]}
      every_second_array = every_second_range.map { |i| reversed_array[i]}
      str_to_int1 = every_first_array.map { |i| i.to_i}
      str_to_int2 = every_second_array.map { |i| i.to_i}
      multiplied_number = str_to_int2.map { |i| ((i * 2)-9 if i >= 5) || i*2 }
      sum_all = multiplied_number + str_to_int1
      sum = sum_all.sum
      return true if sum % 10 == 0
      false
    end
  end
end
