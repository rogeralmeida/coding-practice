#!/bin/ruby

def leftRotation(a, d)
  a.rotate(d)
end
n, d = gets.strip.split(' ')
n = n.to_i
d = d.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)
result = leftRotation(a, d)
print result.joint(' ')
