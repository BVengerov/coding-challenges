def get_nums(filename)
  File.readlines(File.join(File.dirname(__FILE__), filename), chomp: true).map(&:to_i)
end

# https://adventofcode.com/2020/day/1

# @param {Integer[]} nums
# @param {Integer} goal
# @return {Integer[]}
def get_pair(nums, goal)
  hash = nums.each_with_index.to_h
  i = 0
  pair = []
  while i < nums.length && pair.empty?
    compliment = goal - nums[i]
    if hash.key?(compliment) && i != hash[compliment]
      pair << nums[i]
      pair << compliment
    end
    i += 1
  end
  pair
end

raise 'nope' unless get_pair(get_nums('example.txt'), 2020).inject(:*) == 514579
p get_pair(get_nums('report.txt'), 2020).inject(:*)

# https://adventofcode.com/2020/day/1#part2

# @param {Integer[]} nums
# @return {Integer[]}
def get_trio(nums)
  trio = []
  i = 0
  while i < nums.length && trio.empty?
    compliment = 2020 - nums[i]
    arr_to_check = nums
    arr_to_check.delete(i)
    pair = get_pair(arr_to_check, compliment)
    unless pair.empty?
      trio << nums[i]
      trio += pair
    end
    i += 1
  end
  trio
end

raise 'nope' unless get_trio(get_nums('example.txt')).inject(:*) == 241861950
p get_trio(get_nums('report.txt')).inject(:*)
