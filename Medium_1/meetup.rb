# Define a class Meetup with a constructor taking a month and a year
# and a method day(weekday, schedule)
# where weekday is one of :monday, :tuesday, etc
# and schedule is :first, :second, :third, :fourth, :last or :teenth.
#input: constructor: 2 integers- month and year
# day method: 2 symbols -weekday(ie :saturday, :thursday) and schedule (:first, :second, :third, :fourth, :last or :teenth)
# output: a Date object (year, month, day)
# rules: :teenth means 13th = 19th
# algorithm:
# lookup the month and year given
# find the week or teens of that month
#   each symbol equals a method or block
#  find the dates of the first, second, third, fourth, last, week of the month, then go thru each date until you return true for the day of the week
# for teenths, go thru 13 - 19, whichever date returns true for the day of the week is the date
# return a Date object with the month, year, and date

require 'date'
DAYS_OF_WEEK = {:sunday => 0, :monday => 1, :tuesday => 2, :wednesday => 3, :thursday => 4, :friday => 5, :saturday => 6}

DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
DAYS_IN_MONTH_LEAP = [nil, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

DATE_RANGE = {:teenth => (13..19), :first => (1..7), :second => (8..14), :third => (15..21), :fourth => (22..28) }

class Meetup

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)  # returns a Date object
    
    if schedule == :last
      start_date = Date.leap?(@year)? DAYS_IN_MONTH_LEAP[@month] : DAYS_IN_MONTH[@month]

      start_date.downto(start_date-7) do |num|
        return Date.new(@year, @month, num) if Date.new(@year, @month, num).wday == DAYS_OF_WEEK[weekday]
      end

    else
      DATE_RANGE[schedule].each do |num|
        return Date.new(@year, @month, num) if Date.new(@year, @month, num).wday == DAYS_OF_WEEK[weekday]
      end
    end 
    # Date.new(@year, @month, day)
  end 

end


# class Meetup

#   def initialize(month, year)
#     @month = month
#     @year = year
#   end

#   def day(weekday, schedule)  # returns a Date object
    
#     if schedule == :teenth
      
#       day = (13..19).select do |num|
#         Date.new(@year, @month, num).wday == DAYS_OF_WEEK[weekday]
#       end.first
    
#     elsif schedule == :first
#       day = (1..7).select do |num|
#         Date.new(@year, @month, num).wday == DAYS_OF_WEEK[weekday]
#       end.first

#     elsif schedule == :second
#       day = (8..14).select do |num|
#         Date.new(@year, @month, num).wday == DAYS_OF_WEEK[weekday]
#       end.first

#     elsif schedule == :third
#       day = (15..21).select do |num|
#         Date.new(@year, @month, num).wday == DAYS_OF_WEEK[weekday]
#       end.first

#     elsif schedule == :fourth
#       day = (22..28).select do |num|
#         Date.new(@year, @month, num).wday == DAYS_OF_WEEK[weekday]
#       end.first
    
#     else
#       start_date = Date.leap?(@year)? DAYS_IN_MONTH_LEAP[@month] : DAYS_IN_MONTH[@month]

#       day = start_date.downto(start_date-7) do |num|
#         return Date.new(@year, @month, num) if Date.new(@year, @month, num).wday == DAYS_OF_WEEK[weekday]
#       end
#     end 
#     Date.new(@year, @month, day)
#   end 

# end
p  Meetup.new(3, 2013).day(:tuesday, :teenth)  # => Date.new(2013, 3, 19)
p Meetup.new(4, 2013).day(:monday, :last) #=> Date.new(2013, 4, 29)