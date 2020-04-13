module Tools
  class Odd_number
    def initialize(array)
      @array = array
    end

    def one_number
      all_numbers.first
    end

    def all_numbers
      counts = Hash.new(0)
      @array.map { |num| counts[num] += 1 }
      counts.select { |_, num| num == 1 }.keys
    end
  end
end
