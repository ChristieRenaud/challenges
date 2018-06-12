#input: one number indicates which verse to output. Two numbers indicate which verse to start at and which to stop at, going through verses in reverse order.
# if no number is given, output all 100 verses.
#output: a string representing the lyrics to the indicated verse of 99 bottles of beer on the wall. The verse number indicates the number in the song. 
# Numbers count down to zero.
#rules: There are 100 verses total. Verses start with 99 and count downward. 
# Verse one also replaces 'bottles' with 'bottle' and 'one' with 'it'
# Verse two has changes
# Verse zero changes "Take one down and pass it around" to "Go to the store and buy some more"

#algorithm: The first parameter is the verse to start at. The second parameter is the verse to stop at. If only one parameter is given, only output that verse.
# If no argument is passed in, ouput entire song.
# Set default parameters to nil.
# Loop from first argument to second argument. If both arguments are nil, set starting number to 99, and ending number to 0. If only second argument is nil, set ending 
# equal to starting number.
# Each iteration output the string inserting the index in. Replace special cases if index matches the exception rule.

class BeerSong
#  attr_accessor :starting_num; :ending_num


  def verses(starting_num, ending_num)
    @starting_num = starting_num
    @ending_num = ending_num

    song_lyrics = ""
    (@starting_num).downto(@ending_num) do |verse|
      song_lyrics <<  case verse
                      when 2
                        "#{verse} bottles of beer on the wall, #{verse} bottles of beer.\n" +
                        "Take one down and pass it around, #{verse - 1} bottle of beer on the wall.\n"

                      when 1
                        "#{verse} bottle of beer on the wall, #{verse} bottle of beer.\n" +
                        "Take it down and pass it around, no more bottles of beer on the wall.\n"

                      when 0
                        "No more bottles of beer on the wall, no more bottles of beer.\n" +
                        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

                      else
                        "#{verse} bottles of beer on the wall, #{verse} bottles of beer.\n" +
                        "Take one down and pass it around, #{verse - 1} bottles of beer on the wall.\n"
                      end
      song_lyrics << "\n" if verse != @ending_num

    end
    song_lyrics
  end

  def verse(starting_num)
    @starting_num = starting_num
    @ending_num = starting_num
    verses(@starting_num, @ending_num)
  end

  def lyrics
    @starting_num = 99
    @ending_num = 0
    verses(@starting_num, @ending_num)
  end
  
end
#
puts BeerSong.new.verses(99, 97)
#puts BeerSong.new.verse(45, 43)
#BeerSong.new.verse