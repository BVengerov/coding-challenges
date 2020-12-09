def get_data(filename)
  File.readlines(File.join(File.dirname(__FILE__), filename), chomp: true)
end

# https://adventofcode.com/2020/day/8

def acc_before(filename)
  lines = get_data(filename)
  index = 0
  indexes = []
  acc = 0
  until indexes.include?(index)
    indexes << index
    case lines[index][0..2]
    when 'acc'
      acc += lines[index].match(/[\-\+]\d+/).to_s.to_i
      index += 1
    when 'nop'
      index += 1
    when 'jmp'
      index += lines[index].match(/[\-\+]\d+/).to_s.to_i
    end
  end
  acc
end

# p acc_before('example.txt')
# p acc_before('input.txt')

# https://adventofcode.com/2020/day/8#part2

def check(lines_mod)
  index = 0
  indexes = []
  acc = 0
  until index == lines_mod.length
    indexes << index
    case lines_mod[index][0..2]
    when 'acc'
      acc += lines_mod[index].match(/[\-\+]\d+/).to_s.to_i
      index += 1
    when 'nop'
      index += 1
    when 'jmp'
      index += lines_mod[index].match(/[\-\+]\d+/).to_s.to_i
    end
    raise 'nope' if indexes.include?(index)
  end
  acc
end

def acc_after(filename)
  lines = get_data(filename)
  lines.each_with_index do |line, i|
    lines_mod = lines.dup
    case lines[i][0..2]
    when 'acc'
      next
    when 'nop'
      lines_mod[i] = line.dup.sub! 'nop', 'jmp'
    when 'jmp'
      lines_mod[i] = line.dup.sub! 'jmp', 'nop'
    end
    begin
      return check(lines_mod)
    rescue StandardError => e
      puts "Changing line #{line} with index #{i} didn't help. Exception: #{e.message}"
    end
  end
end

p acc_after('example.txt')
p acc_after('input.txt')

