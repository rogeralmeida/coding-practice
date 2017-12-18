# frozen_string_literal: true

class DoubleLinkListNode
  attr_accessor :value, :next_node, :previous_node
  def initialize(value, next_node = nil, previous_node = nil)
    @value = value
    @next_node = next_node
    @previous_node = previous_node
  end
end
