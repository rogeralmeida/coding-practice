require 'benchmark'
require_relative '../../hash_tables/channing_hash_table'

RSpec.describe 'HashTable performance' do
  it 'should have a competitive behaviour when compared to ruby Hash' do
    my_hash = ChainingHashTable.new
    ruby_hash = {}
    Benchmark.bm do |bm|
      bm.report('Inserting 1 million items in my hash table') do
        1000000.times do
          number = Random.rand(10000000)
          my_hash.put(number, number.to_s)
        end
      end
      bm.report('Inserting 1 million items in RUBY hash') do
        1000000.times do
          number = Random.rand(10000000)
          ruby_hash[number]= number.to_s
        end
      end
      bm.report('Adding and finding one extra item in My hash table') do
        my_hash.put(1024, 'this is a fake value')
        my_hash.get(1024)
      end
      bm.report('Adding and finding one extra item in RUBY hash table') do
        ruby_hash[1024] = 'this is a fake value'
        ruby_hash[1024]
      end
    end
  end
end
