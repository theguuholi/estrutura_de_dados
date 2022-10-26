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
end
