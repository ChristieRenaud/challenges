#input: a number in integer or string form
#output: an array containing a series of actions based on the binary conversion of the number
#rules: invalid strings are equal to 0
# lookup table:
# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
# 10000 = Reverse the order of the operations in the secret handshake.
# algorithm:
#1. Setup: Secrethandshake class. Ininitialize method takes one parameter. Define a commands method.
#2. Convert the number the string to an integer. Convert integer to binary number.
#3. Separate number into place values.
#4. Use lookup table to map values to actions. If there is a 1000, reverse order of actions

class SecretHandshake
  BINARY_TO_ACTIONS = { 1 => "wink", 10 => "double blink", 100 => "close your eyes", 1000 => "jump", 10000 => "reverse"}
  def initialize(number)
    @number = number
  end

  # def commands
  #   binary_array = @binary_num.chars 
  #   binary_array.reverse!.map!.with_index do |digit, index|
  #     key = digit.to_i * 10**index
  #     BINARY_TO_ACTIONS[key] 
  #   end
  #   binary_array.delete(nil)
  #   binary_array.reverse!.delete_at(0) if binary_array.last == "reverse"
  #   binary_array
  # end

  # def commands
  #   binary_array = @binary_num.chars 
  #   results = binary_array.reverse.map.with_index do |digit, index|
  #     key = digit.to_i * 10**index
  #     BINARY_TO_ACTIONS[key] 
  #   end
  #   results.delete(nil)
  #   results.reverse!.delete_at(0) if results.last == "reverse"
  #   results
  # end
  def binary_number
    if @number.class == String
      @number =~ /[^01]/ ? "0" : @number
    else
      format("%b", @number)
    end
  end

  def commands
    binary_array = binary_number.chars 
    results = []
    binary_array.reverse.each_with_index do |digit, index|
      key = digit.to_i * 10**index
      results << BINARY_TO_ACTIONS[key] if key != 0
    end
    results.reverse!.delete_at(0) if results.last == "reverse"
    results
  end

end

# p SecretHandshake.new("hello").commands
# p SecretHandshake.new("11001").commands
# p SecretHandshake.new(31).commands
