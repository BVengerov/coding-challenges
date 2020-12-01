# https://adventofcode.com/2020/day/1

# @param {String} report_filename
# @return {Integer}
def repair_report(report_filename)
  nums = File.readlines(File.join(File.dirname(__FILE__), report_filename), chomp: true).map(&:to_i)
  hash = nums.each_with_index.to_h
  i = 0
  pair = []
  while i < nums.length && pair.empty?
    compliment = 2020 - nums[i]
    if hash.key?(compliment) && i != hash[compliment]
      pair << nums[i]
      pair << compliment
    end
    i += 1
  end
  pair.inject(:*)
end

raise 'nope' unless repair_report('example.txt') == 514579
p repair_report('report.txt')