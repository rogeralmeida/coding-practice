require_relative '../linked_lists/doubly_linked_list'

class LinkedListQueue
  def initialize
    @list = DoublyLinkedList.new
  end

  def push value
    @list.push_back value
  end

  def pop
    @list.pop_front
  end

  def empty?
    @list.empty?
  end
end
