require_relative '../../hacker-rank/dynamic-array/solution'

RSpec.describe 'Dynamic array' do
  it 'should return 7 and 3 for
        2 5
      1 0 5
      1 1 7
      1 0 3
      2 1 0
      2 1 1 ' do
    query = Query.new 2
    query.execute [1, 0, 5]
    query.execute [1, 1, 7]
    query.execute [1, 0, 3]
    query.execute [2, 1, 0]
    expect(query.lastAnswer).to eq(7)
    query.execute [2, 1, 1]
    expect(query.lastAnswer).to eq(3)
  end

  it 'should execute the sample 0 file' do
    expected_results = [
      855677723, 75865401, 763845832, 75865401, 709571211, 645102173, 112869154,
      763845832, 449768243, 757848208, 91038209, 205970905, 783321829, 372160176,
      384358662, 67467208, 935143105, 384358662, 309720694, 138234911]
    q = Query.new 100
    result_count = 0
    File.open("#{Dir.pwd}/spec/hacker-rank/dynamic-array-sample0.txt").each do |line|
      query = line.split(' ').map(&:to_i)
      q.execute query
      if query[0] == 2
        expect(q.lastAnswer).to eq(expected_results[result_count])
        result_count += 1
      end
    end
  end
end
