# https://adventofcode.com/2020/day/4

def validate_docs(filename)
  valid = 0
  required_params = ['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid']
  file_path = File.join(File.dirname(__FILE__), filename)
  doc_hashes = File.readlines(file_path, "\n\n").map { |doc_line| doc_line.split.map { |pair_string| pair_string.split(':') }.to_h }
  doc_hashes.reduce(0) { |valids, hash| valids + ((['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid'] - hash.keys).empty? ? 1 : 0) }
end

# p validate_docs('example.txt')
# p validate_docs('input.txt')

# https://adventofcode.com/2020/day/4#part2

def val_year(year, min, max)
  /\d{4}/.match?(year) && year.to_i >= min && year.to_i <= max
end

def val_height(height)
  return unless /\d+(in|cm)/.match?(height)
  height_value = height[0..-3].to_i
  if height[-2..-1] == 'in'
    height_value >= 59 && height_value <= 76
  else
    height_value >= 150 && height_value <= 193
  end
end

def val_hair(hair_colour)
  /^#[0-9a-f]{6}$/.match?(hair_colour)
end

def val_eyes(eye_colour)
  %w[amb blu brn gry grn hzl oth].include?(eye_colour)
end

def val_pid(pid)
  /[0]*[1-9]+/.match?(pid) && /^\d{9}$/.match?(pid)
end

def validate_docs_advanced(filename)
  valid = 0
  required_params = %w[byr iyr eyr hgt hcl ecl pid]
  file_path = File.join(File.dirname(__FILE__), filename)
  doc_hashes = File.readlines(file_path, "\n\n").map { |doc_line| doc_line.split.map { |pair_string| pair_string.split(':') }.to_h }
  doc_hashes.each do |hash|
    next unless (required_params - hash.keys).empty? &&
                val_year(hash['byr'], 1920, 2002) &&
                val_year(hash['iyr'], 2010, 2020) &&
                val_year(hash['eyr'], 2020, 2030) &&
                val_height(hash['hgt']) &&
                val_hair(hash['hcl']) &&
                val_eyes(hash['ecl']) &&
                val_pid(hash['pid'])
    # p hash['pid']
    valid += 1
  end
  valid
end

p validate_docs_advanced('valids.txt')
p validate_docs_advanced('invalids.txt')
p validate_docs_advanced('input.txt')