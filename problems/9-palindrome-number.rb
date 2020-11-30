# https://leetcode.com/problems/palindrome-number/

# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  if x < 0 then return false end
  temp_x = x
  y = 0
  while temp_x > 0
    y *= 10
    y += temp_x % 10
    temp_x /= 10
  end
  y == x
end

raise '1' unless is_palindrome(121) == true
raise '2' unless is_palindrome(-121) == false
raise '3' unless is_palindrome(10) == false
raise '4' unless is_palindrome(-101) == false