#inputs: a word(string) and a list of possible anagrams(array of strings)
#outputs: an array of strings that is a sublist of actual anagrams
#rules: an anagram is a word with all the letters the same letters in a different order, not the same word
#the original word and anagram must have the same capitalization, but not the same letters capitalized

#algorithm:
# loop through possible anagrams
# reject if pos. anagram is same word
# check if PA contains all the same letters regardless of capitalization
# select if all criteria are met and return list

#alternate algorithm
# reject if pos. anagram is same word
#count how many of each letter in original word and save to a hash
#count how many of each letter from original word is in PA



# class Anagram
#   def initialize(word)
#     @word = word
#   end

#   def match(anagrams)
#     anagrams.select do |anagram|
#       anagram.downcase != @word.downcase &&
#         anagram.downcase.chars.sort == @word.downcase.chars.sort
#     end
#   end
# end

class Anagram
  def initialize(word)
    @word = word
  end

  def match(anagrams)
    anagrams.select { |anagram| anagram?(@word, anagram) }
  end

  def anagram?(word1, word2)
    return false if word1.downcase == word2.downcase || word1.length != word2.length
    letters = word1.downcase.chars.uniq
    word1_hash = {}
    word2_hash = {}
    count_letters(word1.downcase, letters, word1_hash)
    count_letters(word2.downcase, letters, word2_hash)
    # p word1_hash
    # p word2_hash
    word1_hash == word2_hash
  end

  def count_letters(word, letters, hash)
    letters.each do |letter|
      hash[letter] = word.count(letter)
    end
  end

end