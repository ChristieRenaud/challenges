# input: a number representing number of spaces in buffer
# output:
# buffer.write(element): add an element to the buffer, in order to the next empty space or after last element has been added
# buffer.read: returns oldest element and removes from buffer
# buffer.write! removes the oldest item and writes element in that space. These are the newest elements
# rules: If you try to read and the buffer is empty an exception is raised.
# if buffer is full an exception is raised and no more elements can be added until an element is read, or an object is overwritten.
# nil is not written to the buffer
# Things to keep track of: oldest object added or order objects are added in.
# If buffer is full or empty
# maximum size of buffer
# data structure: array, hash
# array: always add to the end of the array, always remove from the beginning of the array
# algorithm:
# buffer is an array
# number passed in at initialization is the max number of elements
# to write, add to the end of the array. If the array.size == the max elements, raise an error
# to write nil, do nothing, to overwrite nil, do nothing
# to overwrite, remove first element of the buffer and add the end of the array
# to read, remove first element of array and return it. If buffer is empty,raise a BufferEmptyException.
# to clear buffer, remove all elements
# Exceptions should be rescued



class CircularBuffer
  attr_reader :buffer_array

  class BufferEmptyException < StandardError; end

  class BufferFullException < StandardError; end

  def initialize(number)
    @max_size_of_buffer = number
    @buffer_array = []
  end

  def read
    raise BufferEmptyException, "Buffer is empty" if buffer_array.empty? 
    buffer_array.shift  
  end

  def write(element)
    return if element == nil
    raise BufferFullException, "Buffer is full. Cannot write to buffer." if buffer_full?
    buffer_array.push(element)
  end

  def write!(element)
    return if element == nil
    buffer_array.shift if buffer_full?
    buffer_array.push(element)
  end

  def clear
    #buffer_array.clear
    buffer.array = []
  end

  def buffer_full?
    buffer_array.size >= @max_size_of_buffer
  end

end
