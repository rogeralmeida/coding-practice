class OpenAddressingTable
  attr_reader :size

  def initialize
    @array = Array.new(8)
    @size = 0
  end

  def empty?
    size == 0
  end

  def put key, value
    if (@size.to_f/@array.size) >= 0.6
      double_table 
    end
    try = 1
    key_hash = key.hash
    array_size = @array.size
    loop do
      address = (key_hash + try) % array_size
      item = @array[address]
      if item.nil? || item[:deleted] || item[:key] == key
        @array[address] = {key: key, value: value, deleted: false}
        @size += 1
        break
      end
      try += 1
    end
  end

  def get key
    value = nil
    pair = find_pair key
    value = pair[:value] unless pair.nil? || pair[:deleted]
    value
  end

  def has_key? key
    pair = find_pair key
    pair && pair[:deleted] == false ? true : false
  end

  def delete key
    pair = find_pair key
    if pair
      pair[:deleted] = true
      @size -= 1
    end
  end

  private

  def find_pair key
    try = 1
    pair = nil
    key_hash = key.hash
    array_size = @array.size
    loop do
      address = (key_hash + try) % array_size
      if @array[address]
        pair = @array[address]
        break if pair[:key] == key
      else
        break
      end
      try += 1
    end
    pair
  end

  def double_table
    new_array = Array.new(@array.size * 2)
    @array.each do |item|
      break if item.nil? || item[:deleted]
      try = 1
      key = item[:key]
      loop do
        address = (key.hash + try) % new_array.size
        if new_array[address].nil?
          new_array[address] = item
          break
        end
        try += 1
      end
    end
    @array = new_array
  end
end
