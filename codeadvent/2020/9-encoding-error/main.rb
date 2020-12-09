def get_data(filename)
  File.readlines(File.join(File.dirname(__FILE__), filename), chomp: true)
end

# https://adventofcode.com/2020/day/9

def find_weekness(filename, preamble_length)
  ints = get_data(filename).map(&:to_i)
  ints[preamble_length..-1].each_with_index do |num, index|
    preamble = ints[index..index + preamble_length - 1]
    return num unless preamble.combination(2).any? { |a, b| (a + b) == num }
  end
end

# p find_weekness('example.txt', 5)
# p find_weekness('input.txt', 25)

def find_set_result(filename, target_number)
  nums = get_data(filename).map(&:to_i)
  nums.each_with_index do |num, index|
    set = [num]
    set_index = index
    while set.sum < target_number
      set_index += 1
      set << nums[set_index]
    end
    next unless set.sum == target_number && set.count > 1
    return set.min + set.max
  end
end

p find_set_result('example.txt', 127)
p find_set_result('input.txt', 138879426)
