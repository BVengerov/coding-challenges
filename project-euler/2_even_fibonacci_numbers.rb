# https://projecteuler.net/problem=2

def solution(limit)
  sum = 0
  pair = [1, 1]
  while (term = pair.sum) < limit
    sum += term unless term.odd?
    pair = [pair[1], term]
  end
  sum
end

start = Time.now
raise 'nope' unless [1, 2, 3, 5, 8, 13, 21, 34, 55, 89].select(&:even?).sum == solution(100)
p solution(4_000_000)
finish = Time.now
puts "#{ (finish - start) * 1000 } msec"
