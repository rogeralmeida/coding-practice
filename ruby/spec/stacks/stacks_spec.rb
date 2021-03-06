require_relative '../../stacks/array_stack'
require_relative '../../stacks/linked_list_stack'

[ArrayStack, LinkedListStack].each do |clazz|
  RSpec.describe "Stacks using #{clazz}" do
    before(:each) do
      @stack = clazz.new
    end

    it "Should be empty when created" do
      expect(@stack.empty?).to be true
    end

    it 'should add items to the top of the stack' do
      @stack.put(9)
      expect(@stack.top).to eq(9)
      @stack.put(24)
      expect(@stack.top).to eq(24)
    end

    it 'should remove items from the top of the stack' do
      @stack.put(9)
      @stack.put(24)
      expect(@stack.pop).to eq(24)
      expect(@stack.top).to eq(9)
    end

    it 'should be empty after removing all the items from the stack' do
      @stack.put(9)
      @stack.put(24)
      expect(@stack.pop).to eq(24)
      expect(@stack.pop).to eq(9)
      expect(@stack.empty?).to be true
    end
  end
end
