# frozen_string_literal: true

require_relative '../../linked_lists/singly_head_pointer_linked_list'
require_relative '../../linked_lists/singly_head_and_tail_pointer_linked_list'
require_relative '../../linked_lists/doubly_linked_list'
require 'benchmark'

[SinglyHeadPointerLinkedList, SinglyHeadAndTailPointerLinkedList, DoublyLinkedList].each do |clazz|
  RSpec.describe "Performance for class '#{clazz}" do
    before(:each) do
      @list = clazz.new
    end
    it 'should compare the performance to search a integer in a million long list' do
      Benchmark.bm do |bm|
        bm.report('Inserting a million items in head list') do
          10000.times { @list.push_back Random.rand(10000000) }
        end
        bm.report('list.reverse'){ @list.reverse }
        bm.report('list.push_back'){ @list.push_back(99) }
        bm.report('list.pop_back'){ @list.pop_back }
        bm.report('list.erase'){ @list.erase Random.rand(99) }
      end
    end
  end
end
