module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in 0..self.length - 1
      yield(self[i], i)
    end
    self
  end

  def my_select
    selected = []
    self.my_each do |item|
      selected.push(item) if yield(item) == true
    end
    selected
  end

  def my_all?
    self.my_each do |item|
      return false if yield(item) == false
    end
    true
  end

  def my_any?
    self.my_each do |item|
      return true if yield(item) == true
    end
    false
  end

  def my_none?
    self.my_each do |item|
      return false if yield(item) == true
    end
    return true
  end

  def my_count
    return self.length if block_given? == false
    count = 0
    self.my_each do |item|
      if yield(item)
        count = count + 1
      end
    end
    count
  end

  def my_map
    result = []
    self.my_each do |item|
      result.push(yield(item))
    end
    result
  end

  def my_inject(initial)
    self.my_each do |item|
      initial = yield(initial, item)
    end
    initial
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in 0..self.length - 1
      yield(self[i])
    end
    self
  end
end
