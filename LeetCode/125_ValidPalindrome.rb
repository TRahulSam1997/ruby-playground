# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  s = s.downcase.gsub(/\s+/, "").gsub(/[^0-9a-z ]/i, '')
  s == s.reverse
end

puts is_palindrome("A man, a plan, a canal: Panama")
puts is_palindrome("race a car")
puts is_palindrome("1a2")