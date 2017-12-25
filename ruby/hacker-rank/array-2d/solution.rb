#!/bin/ruby

def sum array, row, col
  a = array[row][col]
  b = array[row][col + 1]
  c = array[row][col + 2]
  d = array[row + 1][col + 1]
  e = array[row + 2][col]
  f = array[row + 2][col + 1]
  g = array[row + 2][col + 2]
  result = a + b + c + d + e + f + g
  result
end

def calculate_max_hour_glass arr
  max = nil
  for row in 0..3
    for col in 0..3
      hour_glass_sum = sum(arr, row, col)
      if max.nil? || hour_glass_sum > max
        max = hour_glass_sum 
      end
    end
  end
  max
end

if __FILE__==$0
  arr = Array.new(6)
  for arr_i in (0..6-1)
      arr_t = gets.strip
      arr[arr_i] = arr_t.split(' ').map(&:to_i)
  end
  p calculate_max_hour_glass arr
end
