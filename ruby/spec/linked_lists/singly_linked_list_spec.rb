require_relative '../../linked_lists/singly_linked_list'
RSpec.describe "SinglyLinkedList" do
  before(:each) do
    @list = SinglyLinkedList.new
  end

  it "append a item at front" do
    @list.push_front(1)
    @list.push_front(23)
    expect(@list.size).to eq(2)
    expect(@list.front).to eq(23)
  end

  it "should should append an item at back" do
    @list.push_back(9)
    @list.push_back(1)
    @list.push_back(5)
    expect(@list.size).to eq(3)
    expect(@list.back).to eq(5)
  end

  it "should should pop an item at back" do
    @list.push_back(9)
    @list.push_back(1)
    expect(@list.size).to eq(2)
    expect(@list.pop_back).to eq(1)
    expect(@list.size).to eq(1)
    expect(@list.back).to eq(9)
  end

  it "should insert a item at a specific position" do
    @list.push_back(9)
    @list.push_back(1)
    @list.push_back(5)
    @list.insert(1, 2)
    expect(@list.size).to eq(4)
    expect(@list.value_at(1)).to eq(2)
  end

  it "should be empty when there is no more items" do
    expect(@list.empty?).to be true
    @list.push_back(9)
    @list.push_back(1)
    expect(@list.empty?).to be false
    @list.pop_back
    @list.pop_back
    expect(@list.empty?).to be true
  end

  it "should erase a item" do
    @list.push_back(9)
    @list.push_back(8)
    @list.push_back(7)
    @list.push_back(6)
    expect(@list.size).to eq(4)
    @list.erase(2)
    expect(@list.size).to eq(3)
    expect(@list.value_at(2)).to eq(6)
  end

  it "should return the value N from the end of the list" do
    @list.push_back(9)
    @list.push_back(8)
    @list.push_back(7)
    @list.push_back(6)
    expect(@list.value_n_from_end(2)).to eq(8)
  end

  it "should remove the first element of a given value" do
    @list.push_back(9)
    @list.push_back(8)
    @list.push_back(7)
    @list.push_back(6)
    @list.push_back(9)
    @list.push_back(1)
    @list.push_back(6)
    @list.push_back(3)
    expect(@list.size).to eq(8)
    @list.remove_value(6)
    expect(@list.size).to eq(7)
    expect(@list.value_at(3)).to eq(9)
    expect(@list.value_at(6)).to eq(3)
  end

  it "shoudl reverse the list" do
    @list.push_back(1)
    @list.push_back(2)
    @list.push_back(3)
    reversed = @list.reverse
    expect(reversed.front).to eq(3)
    expect(reversed.back).to eq(1)
    expect(reversed.value_at(1)).to eq(2)
  end

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
end
