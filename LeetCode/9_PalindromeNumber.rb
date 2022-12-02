# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return true if x.to_s.reverse.to_i == x

  false
end

puts is_palindrome(-121)
