require_relative '../../hash_tables/channing_hash_table'
RSpec.describe 'Hash Table' do
  before(:each) do
    @table = ChainingHashTable.new
  end

  it 'should be empty initially' do
    expect(@table.empty?).to be true
  end

  it 'should store a key-value pair and return the value when search by the key' do
    @table.put('key', 90)
    expect(@table.get('key')).to eq(90)
  end

  it 'should modify the value when receive a new value for the same key' do
    @table.put('zigzag', 9)
    expect(@table.get('zigzag')).to eq(9)
    @table.put('zigzag', 0)
    expect(@table.get('zigzag')).to eq(0)
  end

  it 'should validate if it has a key or not' do
    @table.put(:some_key, Date.today)
    expect(@table.has_key?(:some_key)).to be true
  end

  it 'should delete a key-pair when given a valid key' do
    @table.put('01/01/2001', Date.new)
    expect(@table.has_key?('01/01/2001')).to be true
    @table.delete('01/01/2001')
    expect(@table.has_key?('01/01/2001')).to be false
  end
end
