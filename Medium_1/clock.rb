# input: class method at: 2 numbers, representing hours and minutes

# output: to_s class method: a time string in format "hh:mm"

#rules: two clocks are equal if they have the same time.
# clock runs on a 24 hour system
# you can add or subtract minutes to the time
# algorithm:
# at method: how to save time? 300; '3:00'; 3 hrs, 0 mins
# + and - :
# ==: equal if value is the same
# to_s: format the time in numbers into a string

class Clock
  def initialize(hour, minutes)
    @hour = hour
    @minutes = minutes
    @total_minutes = @hour * 60 + @minutes
  end

  def self.at(hour, minutes=0)
    Clock.new(hour, minutes)
  end

  def +(number) 
    calculate_new_time(number)
  end

  def -(number)
    calculate_new_time(-number)
  end

  def to_s
    format("%02d:%02d", @hour, @minutes)
  end

  def ==(other)
    self.to_s == other.to_s
  end

  def calculate_new_time(number)
    @total_minutes = (@total_minutes + number) % 1440
    @hour, @minutes = @total_minutes.divmod(60)
    Clock.new(@hour, @minutes)
  end
end
#p Clock.at(8).to_s
 # p Clock.at(8) + 30
 # p Clock.at(11, 9)