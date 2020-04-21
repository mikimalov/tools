module Tools
  class Pokemon
    EFFECTIVENESS = {
      'fire' => {
        'fire' => 1,
        'water' => 0.5,
        'electric' => 1,
        'grass' => 2
      },
      'water' => {
        'fire' => 2,
        'water' => 1,
        'electric' => 0.5,
        'grass' => 0.5
      },
      'electric' => {
        'fire' => 1,
        'water' => 2,
        'electric' => 1,
        'grass' => 1
      },
      'grass' => {
        'fire' => 0.5,
        'water' => 2,
        'electric' => 1,
        'grass' => 1
      }
    }

    def initialize(my_type, opposite_type, my_attack, opposite_defence)
      @my_type, @opp_type, @att, @def = my_type, opposite_type, my_attack, opposite_defence
    end

    def calculate_damage
      @my_type == @opp_type ? 0 : 50 * (@att.to_f / @def) * EFFECTIVENESS[@my_type][@opp_type]
    end
  end
end
