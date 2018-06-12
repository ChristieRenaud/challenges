#input: an integer

#output:

# instance method addends:
#   counting from rightmost, double the value of every second digit
#   if any digit becomes greater than 10, subtract 9 from the result
#   return as an array of single digit integers
      # algorithm:
      #   convert to a string and split into an array.
      #   loop through in reverse order, every odd number, double. If the doubled number is 10 or more, subtract 9
      #   map strings to integers

# instance method checksum:
#   add all the digits of the addend method together. Return value is an integer
      # algorithm: reduce array to the sum of the numbers

# instance method valid?:
#   returns true or false based on if the checksum ends in 0, the checksum modulus 10 is equal to zero
      # algorithm: return true if checksum modulo 10 == 0, else false
# 
# class method number:
#   returns a new integer, which is the argument with one digit 0-9 appended to the end.
#   this new number must be a valid checksum
# algorithm:
# convert integer to a string
# from 0 to 9, convert number to a string, append each number to the end of the number string
# convert new string to an integer and test if its a valid checksum using instance method
# return the new integer if true, or move to next digit.

class Luhn
  def initialize(number)
    @number = number
  end

  def addends
    @number.to_s.chars.reverse.map.with_index do |digit, index|
      if index.even?
        digit.to_i
      else 
        digit.to_i >= 5 ? digit.to_i * 2 - 9 : digit.to_i * 2
      end
    end.reverse
  end

  def checksum
    addends.inject(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(num)
    ("0".."9").each do |digit|
      new_num = num.to_s + digit
      return new_num.to_i if new(new_num.to_i).valid?
    end
  end
end

#p Luhn.new(121312).addends #=>[2, 2, 2, 3, 2, 2]

# class Luhn
#   attr_accessor :addends

#   def initialize(number)
#     @addends = find_addends(number)
#   end

#   def find_addends(number)
#     results = number.to_s.chars.reverse.map.with_index do |digit, index|
#                 if index.even?
#                   digit.to_i
#                 else 
#                   digit.to_i >= 5 ? digit.to_i * 2 - 9 : digit.to_i * 2
#                 end
#               end
#     results.reverse
#   end

#   def checksum
#     addends.inject(:+)
#   end

#   def valid?
#     checksum % 10 == 0 ? true : false
#   end

#   def self.create(num)
#     ("0".."9").each do |digit|
#       new_num = num.to_s + digit
#       return new_num.to_i if new(new_num.to_i).valid?
#     end
#   end
# end
