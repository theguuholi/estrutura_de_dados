defmodule Leetcode.Algorithms.Hash.IntersectionOfMultipleArraysTest do
  use ExUnit.Case
  alias Leetcode.Algorithms.Hash.IntersectionOfMultipleArrays

  # Given a 2D integer array nums where nums[i] is a non-empty array of distinct positive integers,
  # return the list of integers that are present in each array of nums sorted in ascending order.

  # Example 1:
  # Input: nums = [[3,1,2,4,5],[1,2,3,4],[3,4,5,6]]
  # Output: [3,4]
  # Explanation:
  # The only integers present in each of
  # nums[0] = [3,1,2,4,5],
  # nums[1] = [1,2,3,4], and
  # nums[2] = [3,4,5,6] are 3 and 4, so we return [3,4].

  test "greets the world" do
    nums = [[3, 1, 2, 4, 5], [1, 2, 3, 4], [3, 4, 5, 6]]
    assert IntersectionOfMultipleArrays.execute(nums) == [3, 4]
  end

  test "greets the world 2" do
    nums = [[1, 2, 3], [4, 5, 6]]
    assert IntersectionOfMultipleArrays.execute(nums) == [3, 4]
  end
end
