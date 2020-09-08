module Tools
  class Scores
    def initialize(scores)
      @scores = scores
    end

    def scores
      @scores
    end

    def latest
      @scores.last
    end

    def personal_best
      @scores.max
    end

    def best_three
      @scores.max(3)
    end

    def latest_is_personal_best?
      latest == personal_best
    end
  end
end
