# https://leetcode.com/problems/two-sum/

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    hash = nums.each_with_index.to_h
    i = 0
    pair = []
    while i < nums.length && pair.empty?
        compliment = target - nums[i]
        if hash.key?(compliment) && i != hash[compliment]
            pair << i
            pair << hash[compliment]
        else
            i += 1
        end
    end
    pair
end

raise "NOPE1" unless two_sum([2,7,11,15], 9) == [0,1]
raise "NOPE2" unless two_sum([3,2,4], 6) == [1,2]
raise "NOPE3" unless two_sum([3,3], 6) == [0,1]