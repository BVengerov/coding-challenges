def get_data(filename)
  File.readlines(File.join(File.dirname(__FILE__), filename), chomp: true)
end

# https://adventofcode.com/2020/day/3

def count_trees(inputFilename, vector)
  trees = 0
  i = 0
  get_data(inputFilename).each_with_index do |line, j|
    next unless j != 0 && (j % vector[1]).zero?
    i += vector[0]
    line *= (1 + (i / line.length).ceil)
    trees += 1 unless line[i] != '#'
  end
  p trees
  trees
end

# raise 'nope' unless count_trees('example.txt', [3, 1]) == 7
# p count_trees('input.txt', [3, 1])

# https://adventofcode.com/2020/day/3#part2

def optimization_multiplication(inputFilename, vectors)
  multiplication = 1
  vectors.each do |vector|
    multiplication *= count_trees(inputFilename, vector)
  end
  multiplication
end

# p optimization_multiplication(
  # 'example.txt',
  # [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
# )

p optimization_multiplication(
  'input.txt',
  [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
)
