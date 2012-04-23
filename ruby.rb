#!/usr/bin/env ruby
#-*- encoding: utf-8 -*-

require 'set'

class Solver
  def initialize
    @memo = Set.new [2,3]
  end
  def solve n
    (n+1..n*2).select{|i| i % 2 != 0 && self.is_prime(i)}.length
  end

#  def is_prime n
#    if @memo.include? n
#      true
#    else
#      result = is_prime_raw n
#      @memo.add n if result
#      result
#    end
#  end

  def is_prime n
    return false if n < 2
    return true if n == 2
    return false if n % 2 == 0
    i = 3
    while i * i <= n
      if n % i == 0
        return false
      end
      i += 2
    end
    return true  
  end
end

solver = Solver.new
loop do
  if gets =~ /(\d+)/
    val = $1.to_i
    break if val == 0
    puts (solver.solve val)
  end
end
