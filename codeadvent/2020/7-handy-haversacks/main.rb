def get_data(filename)
  File.readlines(File.join(File.dirname(__FILE__), filename), chomp: true)
end

# https://adventofcode.com/2020/day/7
def shiny_gold_containers(filename)
  rulez = {}
  get_data(filename).each do |line|
    container_bag = line.match(/^\w+ \w+/)              # "light red"
    line.scan(/\d+ [a-z]+ [a-z]+/).map do |l|    # ["1 bright white", "2 muted yellow"]
      bag = l.match(/[a-z]+ [a-z]+/).to_s
      num = l.match(/\d+/).to_s.to_i
      rulez[bag] = (rulez[bag] || {}).merge({ container_bag.to_s => num })
    end
  end
  calc_recursive(rulez, 'shiny gold', [])
end

def calc_recursive(rulez, bag, result)
  return result unless rulez.key?(bag)
  rulez[bag].reduce(result) do |mem, (key, _val)|
    mem + calc_recursive(rulez, key, mem)
  end
end

# def calc_recursive(big_hash, bag, num)
#   return num unless big_hash.key?(bag)
#   total = big_hash[bag].reduce(0) do |sum, (key, val)|
#     sum + val * calc_recursive(big_hash, key, num)
#   end
# end

p shiny_gold_containers('example.txt')
