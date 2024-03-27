defmodule Leetcode.Algorithms.Hash.LargestUniqueNumberTest do
  use ExUnit.Case
  alias Leetcode.Algorithms.Hash.LargestUniqueNumber

  test "greets the world" do
    nums = [5, 7, 3, 9, 4, 9, 8, 3, 1]
    assert LargestUniqueNumber.largest_unique_number(nums) == 8
  end

  test "greets the world 2" do
    nums = [9, 9, 8, 8]
    assert LargestUniqueNumber.largest_unique_number(nums) == -1
  end
end
