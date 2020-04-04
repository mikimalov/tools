module Tools
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
end