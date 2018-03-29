class Trinary
  BASE = 3
  def initialize(number)
    @number = number
    @digits = number.chars.map(&:to_i)
  end

  def to_decimal
    return 0 if @number.match(/[^0-2]/)
    @digits.inject(0) { |total, number| (total + number) * BASE } / BASE
  end
end

  def to_decimal
    return 0 if @number.match(/[^0-2]/)
    @digits.each_with_index.inject(0) { |total, (number, idx)| total + number * (3**idx) }
  end

#p Trinary.new("1").to_decimal
#p Trinary.new("2").to_decimal
#p Trinary.new("3").to_decimal