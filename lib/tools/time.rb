module Tools
  class Time
    LIMIT = 60

    def initialize(time, hour, minutes, seconds)
      @hour, @min, @sec = time.split(':').map { |num| num.to_i }
      @hour += hour
      @min += minutes
      @sec += seconds
    end

    def adjust_time
      calculate_hours
      "#{@hour}:#{@min}:#{@sec}"
    end

    private

    def calculate_hours
      @hour -= 24 while @hour >= 24
      @min -= LIMIT while @min >= LIMIT && @hour += 1
      @sec -= LIMIT while @sec >= LIMIT && @min += 1
      implementation_details
    end

    def implementation_details
      @sec = @sec.digits.size == 1 ? "0#{@sec}" : @sec.to_s
      @min = @min.digits.size == 1 ? "0#{@min}" : @min.to_s
      @hour = @hour.digits.size == 1 ? "0#{@hour}" : @hour.to_s
    end
  end
end