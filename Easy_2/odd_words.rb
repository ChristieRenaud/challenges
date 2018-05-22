# input: a string containing one or more words separated from each other by one or more spaces and terminated by 0 or more spaces followed by a period.
# output: a string with words separated by a single space with the last word terminated by a single point. Odd words are copied in reverse order, even words are copied exactly.
# rules: words consist of one or more, but at most 20 letters.

# algorithm:
# 1.delete the period
# 2. separate the string into an array, split on white space
# 3. loop through and reverse the words with an even index
# 4. Join the words with a space and add an "." to the end.
# 5. output letter by letter?

# 1. create a new_string_array
# 2. set a var equal to true to keep track of if the character is part of an odd of even word
# 3. loop through the array
# =>   for first character, add to results array
# =>   if next character is not a white space add to array. repeat until you come to a white space.
# =>      add a white space to the array and change even_word to false
# =>      if next character is white space skip until character is a letter
# =>        if even_word is false, add letter to front of a new_array, repeat until you come to a white space
# =>           add space to end of array and add array to previous array
# =>           if next character is white space skip until character is a letter, change even_word to true 
# => if character is a period, add to end of array and return

# =>   

def odd_words(string)
  string = string.delete('.').split.each_with_index.map do |word, index|
    index.odd? ? word.reverse : word
  end
  string = string.join(' ') + '.'
end

def odd_words_bonus(string)
  array = string.split(//)
  new_array = []
  odd_array = []
  even_word = true
  one_space = false
  array.each do |character|
    if even_word
      if character.match(/\./)
        new_array << character
        return new_array.flatten.each { |char| puts char}
      elsif character.match(/\s/)
        if one_space == false
   #       new_array << character
          one_space = true
        else 
          next
        end
      else 
        if one_space == true
          even_word = !even_word
          one_space = false
          odd_array << character
        else
          new_array << character
        end
      end
    else
      if character.match(/\./)
        new_array << " " << odd_array << character
        return new_array.flatten.each { |char| puts char}
      elsif character.match(/\s/)
        if one_space == false
#          odd_array << character
          one_space = true
        else 
          next
        end
      else 
        if one_space == true
          even_word = !even_word
          one_space = false
          new_array << " " << odd_array  << " " << character
          odd_array = []
        else
          odd_array.unshift(character)
        end
      end
    end
  end

end
#p odd_words("whats the matter with kansas.") #=> "whats eht matter htiw kansas"

#p odd_words("whats   the matter with  kansas .") #=> "whats eht matter htiw kansas"

p odd_words_bonus("whats the matter with kansas.") #=> "whats eht matter htiw kansas"

p odd_words_bonus("whats   the matter with  kansas hey  .") #=> "whats eht matter htiw kansas"

