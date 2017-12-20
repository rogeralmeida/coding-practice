class ArrayStack

  def initialize
    @array = []
    @count = 0
  end

  def put value
   @array[@count] = value
   @count += 1
  end

  def top
   @array[@count - 1] 
  end

  def pop
    raise "Cannot pop an empty stack" if empty?
    index = @count - 1
    value = @array[index]
    @array[index] = nil
    @count -= 1
    value
  end

  def empty?
    @count == 0
  end
end
