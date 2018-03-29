#input: a string representation of an octal number
#output: a decimal equtivalent to octal number as an integer

#rules: for going from octal to decimal
# rightmost integer is number * 8^0
# next over to the left is number * 8^1
# next over to the left is number * 8*2
# till the last digit is number * 8^(digits length - 1)
# add all these numbers together
# invalid input returns 0
# numbers that include 8 or 9 are invalid

#algorhythm
# separate nubmer into separate string numbers in an array.
# convert each string number into an integer
# check for invalid numbers, return 0 if any are found in array. (or do that before converting to array?)
# iterate through array with index in reverse order. multiply first number by 8^i. Save answer.
# continue through all numbers in array.
# add all numbers together and return

class Octal
  def initialize(number)
    @number = number
    @digits = number.chars.map(&:to_i)
  end

  # def to_decimal
  #   return 0 if @number.match(/[^0-7]/)
  #   results = 0
  #   @digits.reverse.each_with_index do |digit, index|
  #     results += digit * (8**index)
  #   end
  #   results
  # end

  def to_decimal
    return 0 if @number.match(/[^0-7]/)
    index = 0
    @digits.reverse.inject(0) do |total, number|
      total + (number * (8**index))
      index += 1
    end
  end
end



#examples:
p Octal.new('1').to_decimal #== 1
p Octal.new('10').to_decimal #== 8
p Octal.new('abc17').to_decimal #== 0
