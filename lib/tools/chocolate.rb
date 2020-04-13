module Tools
  class Chocolate
    def initialize(chocolate, white_chocolate)
      @chocolate = chocolate
      @white_chocolate = white_chocolate
    end

    def fairness?
      @chocolate.sum { |a, b| a*b } == @white_chocolate.sum { |a, b| a*b }
    end
  end
end
