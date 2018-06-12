#input: a string of digits and other non alpha characters
#output: the string cleaned up, consisting only of digits
# rules: valid if 10 digits or 11 digits with 1 as the first digit
# may contain '()-.\s'
# if it is invalid, return a string of 10 0's
# number method returns 10 digits 
# area code method returns first 3 digits
# to_s method returns number formatted
# algorithm:
# number:
# remove nonalphanumeric characters from number
# validate number:
#   invalid if contains letters
#   invalid if less than 10 or more than 11
#   invalid if first number of 11 digit number is not 1
#   return 0000000000 for all invalid numbers
# return last 10 characters of number for valid numbers
# area code:
# return first 3 number string of result of number method
# to_s
# format result of number method using regex
# data_structure = string, array

class PhoneNumber
  attr_reader :number_string, :number_length
  
  def initialize(numbers)
    @number_string = numbers.gsub(/[\(\)\-\.\s]/, '')
    @number_length = @number_string.size
  end

  def number
    return '0000000000' if invalid_length? || invalid_characters? || first_number_not_one?
    number_string.slice(-10, 10)
  end
  
  def area_code
    number.slice(0, 3)
  end

  def to_s
    number.gsub(/(...)(...)(....)/, '(\1) \2-\3')
  end

  def invalid_length?
    number_length < 10 || number_length > 11
  end

  def invalid_characters?
    number_string.match(/[a-z]/i)
  end

  def first_number_not_one?
    number_length == 11 && number_string[0] != "1"
  end

end