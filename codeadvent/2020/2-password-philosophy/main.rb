def get_data(filename)
  File.readlines(File.join(File.dirname(__FILE__), filename), chomp: true)
end

# https://adventofcode.com/2020/day/2

def count_valid_passwords_range(inputFilename)
  valids = 0
  get_data(inputFilename).each do |line|
    low, temp = line.split('-')
    temp, password = temp.split(': ')
    high, char = temp.split(' ')
    char_count = password.count(char)
    if low.to_i <= char_count && char_count <= high.to_i
      valids += 1
    end
  end
  valids
end

raise 'nope' unless count_valid_passwords_range('example.txt') == 2
p count_valid_passwords_range('input.txt')

# https://adventofcode.com/2020/day/2#part2

def count_valid_passwords_position(inputFilename)
  valids = 0
  get_data(inputFilename).each do |line|
    low, temp = line.split('-')
    temp, password = temp.split(': ')
    high, char = temp.split(' ')
    if password[low.to_i - 1].count(char) + password[high.to_i - 1].count(char) == 1
      valids += 1
    end
  end
  valids
end

raise 'nope' unless count_valid_passwords_position('example.txt') == 1
p count_valid_passwords_position('input.txt')
