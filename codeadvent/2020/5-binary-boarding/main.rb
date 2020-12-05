def get_data(filename)
  File.readlines(File.join(File.dirname(__FILE__), filename), chomp: true)
end

# https://adventofcode.com/2020/day/5

def all_seat_ids(filename)
  seat_ids = []
  get_data(filename).each do |pass|
    row = find_line(pass[0..6], 'F')
    column = find_line(pass[7..9], 'L')
    seat_ids << row * 8 + column
  end
  seat_ids
end

def find_line(input, lower_half_char)
  line = 0
  input.split('').each_with_index do |char, i|
    line += 2**(input.length - 1 - i) unless char == lower_half_char
  end
  line
end

# p all_seat_ids('example.txt').max
# p all_seat_ids('input.txt').max

# https://adventofcode.com/2020/day/5#part2

def find_seat(input)
  found_seats = all_seat_ids(input)
  all_seats = (0..(found_seats.max)).to_a
  missing_seats = all_seats - found_seats
  missing_seats.each do |seat_id|
    return seat_id unless missing_seats.include?(seat_id - 1) || missing_seats.include?(seat_id + 1)
  end
end

p find_seat('input.txt')
