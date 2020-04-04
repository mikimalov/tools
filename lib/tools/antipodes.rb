module Tools
  # attr_reader :odd, :one_number
  class Antipodes
    def initialize(array)
      @arr = array
    end

    def numbers?
      numbers
    end

  private

    def numbers
      @arr.size <= 2 ? @arr.sum : array_math
    end

    def array_split
      @arr.length.odd? ? @arr.slice!(@arr.size/2) : @arr
      @arr.each_slice(2).to_a
    end

    def array_math
      (array_split.first + array_split.last.reverse).each_slice(2).to_a.transpose.map {|num| num.inject(:+)}.map {|num| num.to_f/2 }
    end
  end
end