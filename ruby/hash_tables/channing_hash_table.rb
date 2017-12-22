require_relative '../linked_lists/singly_head_pointer_linked_list'

class ChainingHashTable

  LARGE_PRIME_NUMBER = 15487469

  def initialize
    @array = Array.new(8) { SinglyHeadPointerLinkedList.new }
    @size = 0
  end

  def empty?
    @size == 0
  end

  def put key, value
    if @size > @array.size
      double_table
    end
    pair = find_pair key
    if pair.nil?
      bucket = find_bucket key
      bucket.push_back({key: key, value: value})
      @size += 1
    else
      pair[:value] = value
    end
  end

  def get key
    pair = find_pair key
    value = nil
    if pair.nil?
      raise "Key not found"
    else
      value = pair[:value]
    end
    value
  end

  def has_key? key
    pair = find_pair key
    !pair.nil?
  end

  def delete key
    bucket_index = (LARGE_PRIME_NUMBER * key.hash) % @array.size
    bucket = @array[bucket_index]
    pair = bucket.find { |p| p[:key] == key }
    bucket.remove_value pair
    @size -= 1
  end

  private

  def find_bucket key
    bucket_index = (LARGE_PRIME_NUMBER * key.hash) % @array.size
    @array[bucket_index]
  end

  def find_pair key
    bucket = find_bucket key
    bucket.find { |p| p[:key] == key }
  end

  def double_table
    new_array = Array.new(@array.size * 2) { SinglyHeadPointerLinkedList.new }
    new_array_size = new_array.size
    @array.each do |bucket|
      loop do
        break if bucket.empty?
        pair = bucket.pop_front
        bucket_index = (LARGE_PRIME_NUMBER * pair[:key].hash) % new_array_size
        new_bucket = new_array[bucket_index]
        new_bucket.push_front pair
      end
    end
    @array = new_array
  end
end
