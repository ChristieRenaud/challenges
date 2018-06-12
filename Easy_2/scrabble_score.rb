#input: a string
#output: a number representing the value of each individual letter added together.
# rules: each letter has a value based on the letter lookup table.
#        empty string, whitespace and nil score zero
#        it's case insensitive
#        one letter words are the minimum to score
# algorithm:
# 1.create a lookup table of values, possible a hash
# 2.verify the string contains at least one letter, if not return 0
# 2.5. convert string to downcase
# 3. separate string into an array and iterate through
#    convert letters to their value and add to a sum variable
#4.  return sum

class Scrabble

  def initialize(word)
    @word = word
  end

  LOOKUP_TABLE = { "a" => 1, "b" => 3, "c" => 3, "d" => 2, "e" => 1, "f" => 4, "g" => 2, 
                   "h" => 4, "i" => 1, "j" => 8, "k" => 5, "l" => 1, "m" => 3, "n" => 1,
                   "o" => 1, "p" => 3, "q" => 10, "r" => 1, "s" => 1, "t" => 1, "u" => 1,
                   "v" => 4, "w" => 4, "x" => 8, "y" => 4, "z" => 10 }

  def score
    return 0 unless @word =~ /[a-z]/i
    @word.downcase.chars.inject(0) { |sum, chars| LOOKUP_TABLE[chars] + sum }
  end

  # def self.score(other_word)
  #   return 0 unless other_word =~ /[a-z]/i
  #   other_word.downcase.chars.inject(0) { |sum, chars| LOOKUP_TABLE[chars] + sum }
  # end

  def self.score(other_word)
    new(other_word).score
  end
end

# p Scrabble.new('').score
# p Scrabble.new(nil).score
# p Scrabble.new(" \t\n").score
# p Scrabble.new("quirky").score
p Scrabble.score('alacrity')