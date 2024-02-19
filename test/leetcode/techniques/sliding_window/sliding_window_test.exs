defmodule Techniques.SlidingWindowTest do
  alias Techniques.SlidingWindow
  use ExUnit.Case

  # Example 1: Given an array of positive integers nums and an integer k,
  # find the length of the longest subarray whose sum is less than or equal to k.

  test "find length" do
    nums = [3, 1, 2, 7, 4, 2, 1, 1, 5]
    k = 8

    assert SlidingWindow.find_length(nums, k) == 4
  end
end
