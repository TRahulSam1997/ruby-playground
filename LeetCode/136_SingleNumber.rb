# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  return nums.each_with_object(Hash.new(0)) { |int, counts| counts[int] += 1 }.select {|int, c| c == 1}.keys.first
end

puts single_number([4,1,2,1,2])