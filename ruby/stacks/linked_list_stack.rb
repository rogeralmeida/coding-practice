require_relative '../linked_lists/singly_head_pointer_linked_list'
class LinkedListStack

  def initialize
    @list = SinglyHeadPointerLinkedList.new
  end

  def put value
    @list.push_front value
  end

  def top
    @list.front
  end

  def pop
    raise "Cannot pop an empty stack" if @list.empty?
    @list.pop_front
  end

  def empty?
    @list.empty?
  end
end
