def get_data(filename)
  File.readlines(File.join(File.dirname(__FILE__), filename), chomp: true)
end

# https://adventofcode.com/2020/day/11

def solution(filename)
  area = get_data(filename).map { |line| line.split('') }
  current_count = 0
  previous_count = -375
  arr = area.clone
  while current_count != previous_count
    previous_count = current_count
    next_iter = Marshal.load(Marshal.dump(arr))
    next_iter.each_with_index do |chars, i|
      chars.each_with_index do |char, j|
        if char == 'L'
          next_iter[i][j] = '#' if occupied(arr, i, j).zero?
        elsif char == '#'
          next_iter[i][j] = 'L' if occupied(arr, i, j) > 4
        end
      end
    end
    current_count = next_iter.map { |arr_i| arr_i.join('') }.join('').count('#')
    arr = Marshal.load(Marshal.dump(next_iter))
  end
  current_count
end

def occupied(arr, i, j)
  count = 0
  for index in i - 1..i + 1
    for jindex in j - 1..j + 1
      if index >= 0 && jindex >= 0 && index < arr.length && jindex < arr[index].length && arr[index][jindex] == '#'
        count += 1
      end
    end
  end
  count
end

# p solution('example.txt')
# p solution('input.txt')

# https://adventofcode.com/2020/day/11#part2


def solution2(filename)
  area = get_data(filename).map { |line| line.split('') }
  current_count = 0
  previous_count = -375
  arr = area.clone
  while current_count != previous_count
    previous_count = current_count
    next_iter = Marshal.load(Marshal.dump(arr))
    next_iter.each_with_index do |chars, i|
      chars.each_with_index do |char, j|
        if char == 'L'
          next_iter[i][j] = '#' if occupied2(arr, i, j).zero?
        elsif char == '#'
          next_iter[i][j] = 'L' if occupied2(arr, i, j) > 4
        end
      end
    end
    current_count = next_iter.map { |arr_i| arr_i.join('') }.join('').count('#')
    arr = Marshal.load(Marshal.dump(next_iter))
  end
  current_count
end

def occupied2(arr, i, j)
  count = 0
  for index in i - 1..i + 1
    for jindex in j - 1..j + 1
      if index >= 0 && jindex >= 0 && index < arr.length && jindex < arr[index].length && arr[index][jindex] == '#'
        count += 1
      end
    end
  end
  count
end

p solution('example.txt')
p solution('input.txt')