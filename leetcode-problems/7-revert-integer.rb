# https://leetcode.com/problems/reverse-integer/

# @param {Integer} x
# @return {Integer}
def reverse(x)
  if x < 0
    sign_multiplier = -1
    x = x.abs
  else
    sign_multiplier = 1
  end

  y = 0
  while x > 0
    y *= 10
    y += x % 10
    x /= 10
  end
  y > 2**31 ? 0 : y * sign_multiplier
end

raise 'nope1' unless reverse(123) == 321
raise 'nope2' unless reverse(-123) == -321
raise 'nope3' unless reverse(120) == 21
raise 'nope4' unless reverse(0) == 0
raise 'nope5' unless reverse(1_534_236_469) == 0
