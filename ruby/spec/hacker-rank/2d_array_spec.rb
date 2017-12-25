require_relative '../../hacker-rank/array-2d/solution'

RSpec.describe "2d array challenge" do

  it "Should return 0 for an empty input" do
    array = [
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0]
    ]
    expect(calculate_max_hour_glass(array)).to eq(0)
  end

  it "Should return 19 for the given sample input" do
    array = [
      [1, 1, 1, 0, 0, 0],
      [0, 1, 0, 0, 0, 0],
      [1, 1, 1, 0, 0, 0],
      [0, 0, 2, 4, 4, 0],
      [0, 0, 0, 2, 0, 0],
      [0, 0, 1, 2, 4, 0]
    ]
    expect(calculate_max_hour_glass(array)).to eq(19)
  end

  it "Should return -6 for the given sample input" do
    array = [
      [-1, -1, 0, -9, -2, -2],
      [-2, -1, -6, -8, -2, -5],
      [-1, -1, -1, -2, -3, -4],
      [-1, -9, -2, -4, -4, -5],
      [-7, -3, -3, -2, -9, -9],
      [-1, -3, -1, -2, -4, -5]
    ]
    expect(calculate_max_hour_glass(array)).to eq(-6)
  end
end
