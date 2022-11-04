# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
  # nums1.delete(0)
  (m...m+n).each do |i|
    nums1[i] = nums2[i - m]
  end
  nums1.sort!
end

nums1 = [-1,0,0,3,3,3,0,0,0]
6
nums2 = [1,2,2]
3

# nums1 = [1, 2, 3, 0, 0, 0]
# nums2 = [2, 5, 6]
  
# merge(nums1, 3, nums2, 3)
merge(nums1, 6, nums2, 3)
print nums1