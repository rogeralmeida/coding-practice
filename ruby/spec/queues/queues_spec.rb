require_relative '../../queues/linked_list_queue'

RSpec.describe 'Queue' do

  before(:each) do
    @queue = LinkedListQueue.new
  end

  it 'should be empty when created' do
    expect(@queue.empty?).to be true
  end

  it 'should add items to the rear and remove from the front' do
    @queue.push(1)
    @queue.push(2)
    @queue.push(3)
    expect(@queue.pop).to eq(1)
    expect(@queue.pop).to eq(2)
  end

  it 'shoud be empty if we remove all the items' do
    @queue.push(1)
    @queue.push(2)
    @queue.push(3)
    expect(@queue.empty?).to be false
    @queue.pop
    expect(@queue.empty?).to be false
    @queue.pop
    expect(@queue.empty?).to be false
    @queue.pop
    expect(@queue.empty?).to be true
  end
end
