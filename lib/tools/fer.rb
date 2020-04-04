module Tools
  class Fer
    def initialize(name)
      @name = name
    end

    def two_fer
      return "One for Alice, one for me." if @name == 'Alice'
      return "One for Bob, one for me." if @name == 'Bob'
      "One for you, one for me."
    end
  end
end
