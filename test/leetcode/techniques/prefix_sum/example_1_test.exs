defmodule Leetcode.Techniques.PrefixSum.Example1Test do
  # // Example 1: Given an integer array nums, an array queries where queries[i] = [x, y] and an integer limit,
  # return a boolean array that represents the answer to each query.
  # A query is true if the sum of the subarray from x to y is less than limit, or false otherwise.
  # // For example, given nums = [1, 6, 3, 2, 7, 2] and queries = [[0, 3], [2, 5], [2, 4]] and limit = 13,
  # the answer is [true, false, true]. For each query, the subarray sums are [12, 14, 12].

  use ExUnit.Case
  alias Leetcode.Techniques.PrefixSum.Example1

  test "squares " do
    nums = [1, 6, 3, 2, 7, 2]
    queries = [[0, 3], [2, 5], [2, 4]]
    limit = 13
    assert Example1.execute(nums, queries, limit) == [true, false, true]
  end
end
