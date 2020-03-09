require "tools/version"

module Tools
  class Luhn
    def initialize(str)
      @str = str
    end

    def valid?
      return false if @str.length <= 2 || @str.length >= 12 ||  @str.chars.any? { |char| ('a'..'z').include? char.downcase }
      return false if @str.include? '-'
      return false if @str.include? '$'
      return false if @str.include? ':'
      true
    end
  end
end
