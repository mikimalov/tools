module Tools
  class Rnatranscription
    RNA = { 'G' => 'C',
      'C' => 'G',
      'T' => 'A',
      'A' => 'U'
    }
    def initialize(sequence)
      @seq = sequence
    end

    def complement_nucleotide
      @seq.chars.map { |nucl| RNA.fetch(nucl, '') }.join
    end
  end
end