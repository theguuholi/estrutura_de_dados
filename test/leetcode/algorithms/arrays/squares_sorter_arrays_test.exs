defmodule Leetcode.Algorithms.SquaresSorterArraysTest do
  use ExUnit.Case
  alias Leetcode.Algorithms.SquaresSorterArrays

  test "squares " do
    nums = [-4, -1, 0, 3, 10]
    assert SquaresSorterArrays.execute(nums) == [0, 1, 9, 16, 100]
  end
end
