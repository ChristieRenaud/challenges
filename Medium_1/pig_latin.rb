# input: a string of letters representing a word or phrase
# output: a string representing the original string modified following the pig latin rules
# rules: if a word begins with a vowel, sound, add "ay" to the end of the word.
#        if a word begins with a consonant sound, move that consonant plus "ay" to the end of the world
# special cases:
#        if a word begins with a ch
#        if a word begins with a qu
#        if a word begins with a squ
#        if a word begins with a thr
#        if a word begins with a th
#        if a word begins with a sch
#        if a word begins with a ye or y + vowel
#        if a word begins with a yt or y + consonant
#        if a word begins with a xe
#        if a word begins with a xr

#
# data structures: string - how to deal with a phrase, lookup table - hash?, case statements? another class?
# algorithm:
# Save string to a variable
# Test if string is a phrase, by splitting on whitespace. If it is call translate phrase method
# Check string against a regex
# transform string based on rules.

class PigLatin
  def self.translate(phrase)

    phrase.split(' ').map do |string|
      case string
      when /\b[xy][b-dfhj-np-tv-z]/ 
        string + "ay"
      when /\bsch|thr/
        string[3..-1]+string[0..2]+"ay"
      when /\b[b-dfhj-np-tv-z]qu/
        string[3..-1]+string[0..2]+"ay"
      when /\bth|ch|qu/
        string[2..-1]+string[0..1]+"ay"
      when /\b[b-dfhj-np-tv-z]/
        string[1..-1]+string[0] + "ay"
      when /\b[aeiou]/
        string + "ay"
      end
    end.join(' ')
  end
end

# Alternative solution:

class PigLatin
  def self.translate(phrase)
    phrase.split(' ').map do |string|
      if self.begins_with_a_vowel_sound?(string)
        string + "ay"
      else
        consonants, rest_of_word = self.parse_consonants(string)
        rest_of_word + consonants + "ay"
      end
    end.join(' ')
  end

  def self.begins_with_a_vowel_sound?(string)
    string.match(/\A([xy][^aeiou])|\A[aeiou]/)
  end  

  def self.parse_consonants(string)
    string_parts = string.match(/\A([^aeiou]*qu|[^aeiou]+)([a-z]+)/) 
    consonants, rest_of_word = string_parts[1], string_parts[2]
  end
end

#p PigLatin.translate('example')