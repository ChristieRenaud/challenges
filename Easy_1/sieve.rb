#input: a limit n. Use this to create a range from 2 to n
#output: an array of all of the primes from 2 to the limit
#rules: a prime is a number only divisible by one and itself
#use the sieve of Eratosthenes to count primes

# algorithm based on Sieve of Eratosthenes 
# start with an array of the range of numbers from 2 to n
# set the starting nubmer to 2
# iterate through the numbers that are multiples of 2 and mark(or remove them), copy to a new array to be tested against?
# increment the starting number and mark all multiples of starting number
# repeat until all numbers have been incremented through, or marked
# do not test numbers that are marked.
# numbers left unmarked are returned as an array

class Sieve
  def initialize(limit)
    @limit = limit
    @numbers_to_check = (2..limit).to_a
  end

  def primes
    discarded = []
    starting_number = 2
    loop do
      break if starting_number > @limit
      @numbers_to_check.each do |num|
        next if discarded.include?(num) || num == starting_number
        discarded << num if num % starting_number == 0
      end
      starting_number += 1
    end
    @numbers_to_check - discarded
  end
end



# example:
p Sieve.new(10).primes #== [2, 3, 5, 7]
    expected = [
      2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59,
      61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127,
      131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191,
      193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257,
      263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331,
      337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401,
      409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467,
      479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563,
      569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631,
      641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709,
      719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797,
      809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877,
      881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967,
      971, 977, 983, 991, 997
    ]
p Sieve.new(1000).primes == expected