#inputs: a string
#output: a hash where keys are the words in the sentence and values are the number of times they occur
#rules: 1. ignore capitalization
# 2. ignore punctuation
# 3. allow words to be separated by commas
# 4. ignore newlines
# 5. include numbers as words
# 6. apostrophes count as letters, unless they surround a word

# algorithm:
# Cleanup the string: Make all letters lowercase, replace punctuation with spaces, except for apostrophes
# Erase single quotes that start and end a word.
# Convert string to an array.
# Create a hash, then loop through the array, saving each word as a key and iterating it when it matches the key.
# Return the hash

class Phrase

  def initialize(string)
    @phrase = string
  end

  def word_count
    words = convert_to_array
    word_hash = {}
    words.uniq.each do | key |
      word_hash[key] = words.count(key)
    end
    word_hash
  end

  def convert_to_array
    phrases = @phrase.downcase.gsub(/[^a-z0-9'\s]/,' ').squeeze(" ").split
    phrases.map { |word| word.gsub(/\A'(.+)'\z/,'\1') }
  end
end

#p Phrase.new("Joe can't tell between 'large' and large.").word_count
