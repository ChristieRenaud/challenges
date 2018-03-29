#input: an integer limit, and optional multiples
#output: the sum of all multiples of given numbers, up to but not including the limit.
#rules: a multiple of a number is a number that can be divided evenly by that number
#if no mulitple is given, use 3 and 5
#approach:
# create a factor, set to one
# mulitply number factor, add to results array
# increment factor, multiply by factor, add to results array
# repeat until result is equal to or greater than limit.
# repeat whole process for other multiples
# delete multiples from results array and sum up


class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def to(limit)
    results = []
    result = 0
    @multiples.each do |mult|
      results << make_multiples(mult, limit)
    end
    results.flatten.uniq.inject(:+)
  end

  def make_multiples(number, limit)
    factor = 1
    array = [0]
    result = 0
    loop do
      result = number * factor
      break if result >= limit
      array << result
      factor += 1
    end
    array
  end

  def self.to(limit)
    results = [0]
    result = 0
    [3, 5].each do |mult|
      factor = 1
      loop do
        result = mult * factor
        break if result >= limit
        results << result
        factor += 1
      end
      results
    end
    results.uniq.inject(:+)
  end
end

# p SumOfMultiples.to(100) #== 2318

# p SumOfMultiples.new(7, 13, 17).to(20) #== 51
# p SumOfMultiples.new(4, 6).to(15) #== 30