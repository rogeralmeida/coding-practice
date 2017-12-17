# frozen_string_literal: true

require_relative '../../linked_lists/singly_head_pointer_linked_list'
require_relative '../../linked_lists/singly_head_and_tail_pointer_linked_list'
require 'benchmark'

RSpec.describe 'Performance for Linked Lists' do
  it 'should compare the performance to search a integer in a million long list' do
    head = SinglyHeadPointerLinkedList.new
    tail = SinglyHeadAndTailPointerLinkedList.new
    Benchmark.bm do |bm|
      bm.report('Inserting a million items in head list') do
        10000.times { head.push_back Random.rand(10000000) }
      end
      bm.report('Inserting a million items in tail list') do
        10000.times { tail.push_back Random.rand(10000000) }
      end
      bm.report('Reversing head list'){ head.reverse }
      bm.report('Reversing tail list'){ tail.reverse }
      bm.report('head.append'){head.push_back(99)}
      bm.report('tail.append'){tail.push_back(99)}
    end
  end
end
