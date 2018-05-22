#inputs: Two strings representing strands of DNA
#outputs: An integer representing the number of Differences between analogous positions in each string
#rules: Only check differences in first n letters, where n is the length of the shortest string. Empty string are equal to zero

#algorithm:
# compare lenghths and only save the number of characters of the shorter string
# loop through both strings, compare character at the same index. Increment the solution.



class DNA
  def initialize(string)
    @dna_1 = string
  end

  def hamming_distance(dna_2)
    length = [@dna_1.length, dna_2.length].min
    mutations = 0
    length.times do |index|
      mutations += 1 if @dna_1[index] != dna_2[index]
    end

    mutations
  end
end


p DNA.new('GGACTGA').hamming_distance('GGACTGA')
p DNA.new('ACT').hamming_distance('GGA')