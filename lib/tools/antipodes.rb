module Tools
  class Antipodes
    def initialize(array)
      @arr = array
      @arr.length.odd? ? @arr.slice!(array_size) : @arr
    end

    def array_size
      @arr.size/2
    end

    def array_split
      @arr.each_slice(2).to_a
    end

    def array_sum
      (array_split.first + array_split.last.reverse).each_slice(2).to_a.transpose.map {|num| num.inject(:+)}
    end

    def devide
      array_sum.map {|num| num.to_f/2}
    end
  end
end