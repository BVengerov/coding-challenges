# https://adventofcode.com/2020/day/1

# @param {Integer[]} report
# @return {Integer}
def repair_report(report)
  hash = report.each_with_index.to_h
  i = 0
  pair = []
  while i < report.length && pair.empty?
    compliment = 2020 - report[i]
    if hash.key?(compliment) && i != hash[compliment]
      pair << report[i]
      pair << compliment
    end
    i += 1
  end
  pair.inject(:*)
end

raise 'nope' unless repair_report([1721, 979, 366, 299, 675, 1456]) == 514579
p repair_report(File.readlines('codeadvent/2020/1-report-repair-report.txt', chomp: true).map(&:to_i))