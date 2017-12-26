#!/bin/ruby

n, m = gets.strip.split(' ').map(&:to_i)
array = Array.new(n+1, 0)
m.times do
  a, b, k = gets.strip.split(' ').map(&:to_i)
  array[a - 1] += k
  array[b] -= k
end
temp = 0
max = 0
array.each do |value|
  temp += value
  max = temp if temp > max
end
p max
