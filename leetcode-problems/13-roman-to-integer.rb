# https://leetcode.com/problems/roman-to-integer/

# @param {String} s
# @return {Integer}
def roman_to_int(s)
  roman_doubles = { 'CM' => 900, 'CD' => 400, 'XC' => 90, 'XL' => 40, 'IX' => 9, 'IV' => 4}
  roman_singles = { 'M' => 1000, 'D' => 500, 'C' => 100, 'L' => 50, 'X' => 10, 'V' => 5, 'I' => 1}
  sum = 0
  i = 0
  while i < s.length
    if roman_doubles.key?(s[i, 2])
      sum += roman_doubles[s[i, 2]]
      i += 2
    else
      sum += roman_singles[s[i, 1]]
      i += 1
    end
  end
  sum
end

raise 'nope' unless 3 == roman_to_int('III')
raise 'nope' unless 4 == roman_to_int('IV')
raise 'nope' unless 9 == roman_to_int('IX')
raise 'nope' unless 58 == roman_to_int('LVIII')
raise 'nope' unless 1994 == roman_to_int('MCMXCIV')
