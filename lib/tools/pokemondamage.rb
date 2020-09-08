module Tools
  class Pokemondamage
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

    def initialize(type1, type2, attack, defence)
      @type1, @type2, @att, @def = type1, type2, attack, defence
    end

    def damage
      @type1 == @type2 ? 0 : 50 * (@att.to_f / @def) * EFFECTIVENESS[@type1][@type2]
    end
  end
end
