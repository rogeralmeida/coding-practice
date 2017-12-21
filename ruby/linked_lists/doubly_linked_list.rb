# frozen_string_literal: true

# size() - returns number of data elements in list
# empty() - bool returns true if empty
# value_at(index) - returns the value of the nth item (starting at 0 for first)
# push_front(value) - adds an item to the front of the list
# pop_front() - remove front item and return its value
# push_back(value) - adds an item at the end
# pop_back() - removes end item and returns its value
# front() - get value of front item
# back() - get value of end item
# insert(index, value) - insert value at index, so current item at that index is pointed to by new item at index
# erase(index) - removes node at given index
# value_n_from_end(n) - returns the value of the node at nth position from the end of the list
# reverse() - reverses the list
# remove_value(value) - removes the first item in the list with this value
require_relative './double_link_list_node'
require_relative './findable'

class DoublyLinkedList
  include Findable
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
    if empty?
      node = DoubleLinkListNode.new value
      @head = node
      @tail = node
    else
      node = DoubleLinkListNode.new value, @head, nil
      @head = node
    end
    if size == 1
      @tail.previous_node = @head
    end
    @size += 1
  end

  def push_back value
    if @size == 0
      node = DoubleLinkListNode.new value
      @head = node
      @tail = node
    elsif @size == 1
      node = DoubleLinkListNode.new value, nil, @head
      @head.next_node = node
      @tail = node
      @tail.previous_node = @head
    else
      node = DoubleLinkListNode.new value, nil, @tail
      @tail.next_node = node
      @tail = node
    end
    @size += 1
  end

  def pop_front
    raise "Empty list" if empty?
    value = @head.value
    if @size == 1
      @tail = nil
      @head = nil
    elsif @size == 2
      @tail.previous_node = nil
      @head = @tail
    else
      @head = @head.next_node
    end
    @size -= 1
    value
  end

  def pop_back
    raise "Empty list" if empty?
    value = @tail.value
    if @size == 1
      @tail = nil
      @head = nil
    elsif @size == 2
      @head.next_node = nil
      @tail = @head
    else
      node = node_at(@size - 2)
      node.next_node = nil
      @tail = node
    end
    @size -= 1
    value
  end

  def front
    @head.value
  end

  def back
    @tail.value
  end

  def insert index, value
    raise "Index out of bounds" if index < 0 || index > (@size - 1)
    if index == 0
      push_front value
    else
      node = node_at(index - 1)
      new_node = DoubleLinkListNode.new value, node.next_node, node
      if node != @tail
        node.next_node.previous_node = new_node
      end
      node.next_node = new_node
      @size += 1
    end
  end

  def erase index
    raise "Index out of bounds" if index < 0 || index > (@size - 1)
    if index == 0
      @head = @head.next_node
      @head.previous_node = nil
    elsif index == (@size - 1)
      @tail = @tail.previous_node
      @tail.next_node = nil
    else
      node = node_at(index)
      node.previous_node.next_node = node.next_node
      node.next_node.previous_node = node.previous_node
    end
    @size -= 1
  end

  def value_n_from_end index
    position = 0
    node = @tail
    loop do
      break if position == index 
      position += 1
      node = node.previous_node
    end
    node.value
  end

  def reverse
    reversed = DoublyLinkedList.new
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

  def node_at index
    node = @head
    current_position = 0
    loop do
      break if current_position == index
      current_position += 1
      node = node.next_node
    end
    raise "Could find node at index '#{index}'" if current_position != index
    node
  end
end
