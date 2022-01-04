class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    count = 0
    strands = [@strand, other_strand].map { |str| str.split('') }
    strands.min_by { |arr| arr.size }.each_index do |i|
      count += 1 if strands[0][i] != strands[1][i]
    end
    count
  end
end