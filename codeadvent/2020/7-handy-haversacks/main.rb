def get_data(filename)
  File.readlines(File.join(File.dirname(__FILE__), filename), chomp: true)
end

# https://adventofcode.com/2020/day/7

def shiny_gold_containers(filename)
  rulez = get_rulez(filename)
  containers_recursive(rulez, 'shiny gold').uniq.count
end

def containers_recursive(rulez, bag)
  return [] unless rulez.include?(bag)
  rulez[bag].keys.reduce(rulez[bag].keys) do |mem, key|
    mem + containers_recursive(rulez, key)
  end
end

def get_rulez(filename)
  rulez = {}
  get_data(filename).each do |line|
    container_bag = line.match(/^\w+ \w+/)
    line.scan(/\d+ [a-z]+ [a-z]+/).map do |l|
      bag = l.match(/[a-z]+ [a-z]+/).to_s
      num = l.match(/\d+/).to_s.to_i
      rulez[bag] = (rulez[bag] || {}).merge(container_bag.to_s => num)
    end
  end
  rulez
end

# p shiny_gold_containers('example.txt')
# p shiny_gold_containers('input.txt')

# https://adventofcode.com/2020/day/7#part2

def shiny_gold_count(filename)
  rulez = get_rulez(filename)
  count_recursive(rulez, 'shiny gold', rulez['shiny gold'].values.sum)
end

def count_recursive(rulez, bag, total)
  return 0 unless rulez.include?(bag)
  rulez[bag].each_pair.reduce(total) do |mem, (key, val)|
    mem + val * count_recursive(rulez, key, mem)
  end
end

p shiny_gold_count('example.txt')
