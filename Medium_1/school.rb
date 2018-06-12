#school methods
#school.to_h - output is a hash. Keys are grades (1, 2, etc.), values are an array of names of students
# in that grade, sorted in alphabetic order
#school.add() - input is (name (string), grade number (integer)
#school.grade(number) input is grade nunmber(integer). output is an array of students in that grade in abc order.
# data structures:
# School.new: hash?
# algorithm:
# 1. initialize method: initilize an empty hash (school?)
# 2. add method: school hash[grade] = name, 
# 3. sort_names method - used in add method? or to_h method
# 4. to_h method: output school hash
# 5. grade_method: return values of given key, in abc order

class School

  def initialize
    @school = Hash.new{[]}
  end

  def add(name, grade)
    @school[grade] += name
    @school.map! { |k, v| v.sort }
  end

  def to_h
    @school
  end

  def grade(grade)
    @school[grade]
  end

end

