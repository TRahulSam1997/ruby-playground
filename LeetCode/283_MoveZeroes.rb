# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
    nums.replace (nums.sort_by.with_index do |v, i|
        v == 0 ? (nums.length + i) : i
    end)
end

nums = Array[0,1,0,3,12]
puts (move_zeroes(nums))