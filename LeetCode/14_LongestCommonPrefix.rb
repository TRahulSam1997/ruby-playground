# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  if strs.length == 0
    return ""
  end

  if strs.length == 1
    return strs[0]
  end

  strs.sort!

  min_length = [strs[0].length, strs[strs.length - 1].length].min

  i = 0
  while i < min_length && strs[0][i] == strs[strs.length - 1][i]
    i = i + 1
  end

  pre = strs[0][0, i]

  return pre

end

puts longest_common_prefix(["dog","racecar","car"])
