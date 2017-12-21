require_relative '../linked_lists/singly_head_pointer_linked_list'

class ChainingHashTable

  def initialize
    @array = Array.new(8) { SinglyHeadPointerLinkedList.new }
    @array_size = 8
    @size = 0
  end

  def empty?
    @size == 0
  end

  def put key, value
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
    bucket_index = key.hash % @array_size 
    bucket = @array[bucket_index]
    pair = bucket.find { |p| p[:key] == key }
    bucket.remove_value pair
    @size -= 1
  end

  private

  def find_bucket key
    bucket_index = key.hash % @array_size 
    @array[bucket_index]
  end

  def find_pair key
    bucket = find_bucket key
    bucket.find { |p| p[:key] == key }
  end
end
