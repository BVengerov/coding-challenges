def get_data(filename)
  File.readlines(File.join(File.dirname(__FILE__), filename), chomp: true)
end

# https://adventofcode.com/2020/day/10

def diffs(filename)
  devices = [0] + get_data(filename).map(&:to_i).sort
  differences = { 1 => 0, 3 => 1 } # The diff to adapter is always 3
  i = 0
  while i < devices.length - 1
    differences[devices[i + 1] - devices[i]] += 1
    i += 1
  end
  differences.values.inject(:*)
end

p diffs('example.txt')
p diffs('example2.txt')
p diffs('input.txt')

# https://adventofcode.com/2020/day/10#part2

def get_arrangements(filename)
  devices = [0] + get_data(filename).map(&:to_i).sort
  arrangements = 1
  i = 0
  while i < devices.length
    if devices[i + 4] && devices[i + 4] - devices[i] == 4
      arrangements *= 7
      i += 4
    elsif devices[i + 3] && devices[i + 3] - devices[i] == 3
      arrangements *= 4
      i += 3
    elsif devices[i + 2] && devices[i + 2] - devices[i] == 2
      arrangements *= 2
      i += 2
    else
      i += 1
    end
  end
  arrangements
end

p get_arrangements('example.txt')
p get_arrangements('example2.txt')
p get_arrangements('input.txt')
