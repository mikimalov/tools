module Tools
  class Acronym
    def initialize(acronym)
     @acr = acronym
    end

    def abbreviate
     first_letters_only
    end

  private

    def remove_punctuation
     @acr.sub('-', ' ')
    end

    def first_letters_only
     remove_punctuation.split.map { |i| i.chr}.join.upcase
    end
  end
end
