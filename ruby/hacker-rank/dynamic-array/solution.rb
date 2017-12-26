#!/bin/ruby

class Query
  attr_reader :lastAnswer
  def initialize number
    @number = number
    @lastAnswer = 0
    @seqList = Array.new(number) { [] }
  end

  def execute query
    query_type = query[0]
    if query_type == 1
      index = (query[1] ^ @lastAnswer) % @number
      @seqList[index] << query[2]
    elsif query_type == 2
      #require 'debug'
      index = (query[1] ^ @lastAnswer) % @number
      seq = @seqList[index]
      @lastAnswer = seq[query[2] % seq.size]
    end
  end
end

if __FILE__==$0
  first_line = gets.strip
  first_line_array = first_line.split(' ').map(&:to_i)
  n = first_line_array[0]
  number_of_queries = first_line_array[1]
  query_object = Query.new n
  number_of_queries.times do
    line = gets.strip
    query = line.split(' ').map(&:to_i)
    query_object.execute query
    if query[0] == 2
      p query_object.lastAnswer
    end
  end
end
