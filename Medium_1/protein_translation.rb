#input: a string of 3 letters(of_codon method), or a string with multiple 3-letter codes, without space between(of_rna method). Strings are combinations of U, A, G, C.
#output: a string representing a protein or STOP(of_codon method), or an array of protein strings(of_rna method)
# rules: if the input is not valid, raise InvalidCodonError
# Lookup table Data structure: multiple codes match to the same protein. Hash, class
# If a string translates to stop, then for of_rna method, that string is not returned and no more strings are translated.
# Algorithm
#create lookup table
# of codon method:
# works on a string
# validate string
# loop through the protein table
# if the key array includes the code passed into the method, return the value associated with the code

# of_rna method:
# split into an array of 3 letters each
# loop through array, call codon method, add to an array
# break if stop is encountered
class InvalidCodonError < StandardError; end

class Translation

  PROTEIN_TABLE = { %w(AUG) => "Methionine",
                    %w(UUU UUC) => "Phenylalanine",
                    %w(UUA UUG) => "Leucine",
                    %w(UCU UCC UCA UCG) => "Serine",
                    %w(UAU UAC) => "Tyrosine",
                    %w(UGU UGC) => "Cysteine",
                    %w(UGG) => "Tryptophan",
                    %w(UAA UAG UGA) => "STOP" }


  def self.of_rna(array)
    proteins = []
    array.scan(/.../).each do |code|
      protein = self.of_codon(code)
      break if protein == "STOP"
      proteins << protein
    end
    proteins
  end

  def self.of_codon(strand)
    raise InvalidCodonError unless PROTEIN_TABLE.keys.flatten.include?(strand)
    
    PROTEIN_TABLE.each do |key, value|
      return value if key.include?(strand)
    end
  end
end

#p Translation.of_rna('UGGUGUUAUUAAUGGUUU')
