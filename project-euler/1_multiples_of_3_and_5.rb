# https://projecteuler.net/problem=1

def solution(limit)
  multiples = []
  i = 0
  while i < limit
    if i % 3 == 0 || i % 5 == 0
      multiples << i
    end
    i += 1
  end
  p multiples.sum
end

start = Time.now
solution(10000)
finish = Time.now
puts "#{ (finish - start) * 1000 } msec"

def sumDivisibleBy(n, limit)
  p = ((limit - 1) / n).floor
  n * p * (p + 1) / 2
end

def solution_opt(limit)
  sumDivisibleBy(3, limit) + sumDivisibleBy(5, limit) - sumDivisibleBy(15, limit)
end

start = Time.now
solution_opt(10000)
finish = Time.now
puts "#{ (finish - start) * 1000 } msec"
