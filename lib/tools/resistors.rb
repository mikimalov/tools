module Tools
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