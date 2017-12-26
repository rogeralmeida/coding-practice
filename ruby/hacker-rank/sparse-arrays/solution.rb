#!/bin/ruby

if __FILE__==$0
  number_of_strings = gets.strip.to_i
  strings_array = []
  number_of_strings.times do
    strings_array << gets.strip
  end
  number_of_queries = gets.strip.to_i
  number_of_queries.times do
    query = gets.strip
    p strings_array.count query
  end
end
