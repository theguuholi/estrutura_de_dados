defmodule Leetcode.Apple.ArraysAndStrings.TwoSumTest do
  use ExUnit.Case
  alias Leetcode.Apple.ArraysAndStrings.TwoSum

  #Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
  # You may assume that each input would have exactly one solution, and you may not use the same element twice.
  #You can return the answer in any order.

  test "greets the world" do
    nums = [2, 7, 11, 15]
    target = 9
    assert TwoSum.two_sum(nums, target) == [0,1]
  end

  test "greets the world 2" do
    nums = [3, 2, 4]
    target = 6
    assert TwoSum.two_sum(nums, target) == [1, 2]
  end

  test "greets the world 3" do
    nums = [3, 2, 3]
    target = 6
    assert TwoSum.two_sum(nums, target) == [0,2]
  end
end
