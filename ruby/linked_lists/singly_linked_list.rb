   #size() - returns number of data elements in list
   #empty() - bool returns true if empty
   #value_at(index) - returns the value of the nth item (starting at 0 for first)
   #push_front(value) - adds an item to the front of the list
   #pop_front() - remove front item and return its value
   #push_back(value) - adds an item at the end
   #pop_back() - removes end item and returns its value
   #front() - get value of front item
   #back() - get value of end item
   #insert(index, value) - insert value at index, so current item at that index is pointed to by new item at index
   #erase(index) - removes node at given index
   #value_n_from_end(n) - returns the value of the node at nth position from the end of the list
   #reverse() - reverses the list
   #remove_value(value) - removes the first item in the list with this value
require_relative './list_node'

class SinglyLinkedList
  attr_reader :size

  def initialize
    @size = 0
  end

  def empty?
    @size == 0
  end

  def value_at index
    node_at(index).value 
  end

  def push_front value
    node = ListNode.new value, @head    
    @head = node
    @size += 1
  end

  def push_back value
    if @head.nil?
      push_front value
    else
      last_node.next_node = ListNode.new value 
      @size += 1
    end
  end

  def pop_front
    value = @head.value
    @head = @head.next_node
    @size -= 1
    value
  end

  def pop_back
    value = nil
    if @size == 1
      value = @head.value 
      @head = nil
      @size -= 1
    else
      node = node_at(@size - 2)
      value = node.next_node.value
      node.next_node = nil
      @size -= 1
    end
    value
  end

  def front
    @head.value
  end

  def back
    last_node.value
  end

  def insert index, value
    if index == 0
      push_front value
    else
      node = node_at(index - 1)
      node.next_node = ListNode.new value, node.next_node
      @size += 1
    end
  end

  def erase index
    node = @head
    if index > 0
      node = node_at(index - 1) 
    end
    node.next_node = node.next_node.next_node
    @size -= 1
  end

  def value_n_from_end index
    node_at(@size - (index + 1)).value  
  end

  def reverse
    reversed = SinglyLinkedList.new
    node = @head
    while !node.nil? do
      reversed.push_front node.value
      node = node.next_node
    end
    reversed
  end

  def remove_value value
    previous_node = nil
    node = @head
    loop do
      if node.value == value
        previous_node.next_node = node.next_node 
        @size -= 1
        break
      end
      previous_node = node
      node = node.next_node
    end
  end

  private

  def last_node
    if @head.nil?
      raise "Cannot find the last node when the list is empty"
    end
    node = @head
    loop do
      break if node.next_node.nil?
      node = node.next_node
    end
    node
  end

  def node_at index
    node = @head
    current_position = 0
    loop do
      break if current_position == index
      current_position += 1
      node = node.next_node
    end
    node
  end
end
