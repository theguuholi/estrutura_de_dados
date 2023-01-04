defmodule Leetcode.Apple.ArraysAndStrings.ThreeSumTest do
  use ExUnit.Case
  alias Leetcode.Apple.ArraysAndStrings.ThreeSum

  # Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k,
  #  and nums[i] + nums[j] + nums[k] == 0.
  # Notice that the solution set must not contain duplicate triplets.

  test "greets the world O(n2)" do
    nums = [-1, 0, 1, 2, -1, -4]
    assert ThreeSum.ex_1(nums) == [[-1, 0, 1], [-1, -1, 2]]
  end

  # JS
  # nums = [-1,0,1,2,-1,-4]

  # function threeSum(nums) {
  #     if(nums.length < 3) return []
  #     const output = []
  #     nums.sort((a,b) => a - b)
  #     for(i = 0; i < nums.length - 2;i++) {
  #         if (i > 0 && nums[i] === nums[i - 1]) continue
  #         left = i+1
  #         right = nums.length-1

  #         while (left < right) {
  #             const sum = nums[i] + nums[right] + nums[left]
  #             if(sum===0) {
  #                 output.push([nums[i], nums[left], nums[right]])
  #                 while(nums[left]===nums[left+1]) left++
  #                 while(nums[right]===nums[right-1]) right--
  #                 left++
  #                 right--
  #             } else if (sum > 0) {
  #                right--
  #             } else {
  #                 left++
  #             }
  #         }
  #     }

  #     return output
  # };
  # console.log(threeSum(nums));
end
