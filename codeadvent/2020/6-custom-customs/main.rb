# https://adventofcode.com/2020/day/6

def solution_split(filename)
  groups = File.readlines(File.join(File.dirname(__FILE__), filename), "\n\n")
  groups.reduce(0) { |memo, group| memo + group.tr("\n", '').split('').uniq.count }
end

def solution_scan(filename)
  groups = File.readlines(File.join(File.dirname(__FILE__), filename), "\n\n")
  groups.reduce(0) { |memo, group| memo + group.scan(/[a-z]/i).uniq.count }
end

# start = Time.now
# p solution_split('example.txt')
# finish = Time.now
# puts "Solution with split: #{ (finish - start) * 1000 } msec"

# start = Time.now
# p solution_scan('example.txt')
# finish = Time.now
# puts "Solution with scan: #{ (finish - start) * 1000 } msec"

# ^^^ Scan is ~x2 times faster!

# p solution_scan('example.txt')
# p solution_scan('input.txt')

# https://adventofcode.com/2020/day/6#part2

def solution2(filename)
  groups = File.readlines(File.join(File.dirname(__FILE__), filename), "\n\n", chomp: true)
  groups.reduce(0) do |memo, group|
    a = group.chomp.split('')
    answered_by_all = a.uniq.reduce(0) do |m, e|
      e != "\n" && a.count(e) > a.count("\n") ? m + 1 : m
    end
    memo + answered_by_all
  end
end

p solution2('example.txt')
p solution2('input.txt')
