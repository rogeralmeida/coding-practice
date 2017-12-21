module Findable
  def find
    node = @head
    loop do
      break if node.nil?
      break if yield node.value
      node = node.next_node
    end
    if node.nil?
      return nil
    else
      node.value
    end
  end
end
