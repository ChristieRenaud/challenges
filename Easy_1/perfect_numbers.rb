#input: a number
#output: a string indicating perfect, abundant, or deficient
#rules: 1. Number must be a positive integer
#2. perfect number is equal to the sum of its divisors, excluding the number itself
#3. abundant number is less than the sum of its divisors
#4. deficient number is greater than the sum of its divisors

#algorithm:
#1. Verify the number is a positive integer. If not raise a RuntimeError
#2. Find the divisors of the number
#3. Sum up the divisors
#4. Return perfect, abundant, or deficient depending on comparison to number

# class PerfectNumber
#   def classify(number)
#     @number = number
#     verify_number
#     case number <=> aquilot_sum 
#     when -1
#       'abundant'
#     when 0
#       'perfect'
#     when 1
#       'deficient'
#     end
#   end

#   def verify_number
#     raise RuntimeError if !@number.to_s.match(/\d+/) || @number <= 0
#   end

#   def aquilot_sum
#     (1..@number/2).inject do |sum, num|
#         @number % num == 0 ? sum + num : sum
#     end
#   end
# end

# p PerfectNumber.new.classify(13)
# p PerfectNumber.new.classify(28)
# p PerfectNumber.new.classify(12)


class PerfectNumber
  def self.classify(number)
    raise RuntimeError if !number.to_s.match(/\d+/) || number <= 0
    case number <=> aquilot_sum(number)
    when -1 then 'abundant'
    when 0 then 'perfect'
    when 1 then 'deficient'
    end
  end

  def self.aquilot_sum(number)
    (1..number/2).inject do |sum, num|
        number % num == 0 ? sum + num : sum
    end
  end
end

# p PerfectNumber.classify(13)
# p PerfectNumber.classify(28)
# p PerfectNumber.classify(12)
