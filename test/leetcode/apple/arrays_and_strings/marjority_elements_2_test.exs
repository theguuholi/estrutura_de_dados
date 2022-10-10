defmodule Leetcode.Apple.ArraysAndStrings.MarjorityElements2Test do
  use ExUnit.Case
  alias Leetcode.Apple.ArraysAndStrings.MarjorityElements2

  # Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.

  test "1" do
    nums = [3, 2, 3]
    assert MarjorityElements2.majority_element(nums) == [3]
  end

  # test "2" do
  #   nums = [1]
  #   assert MarjorityElements2.majority_element(nums) == [1]
  # end

  # test "3" do
  #   nums = [1, 2]
  #   assert MarjorityElements2.majority_element(nums) == nums
  # end

  # test "4" do
  #   nums = [1, 2, 3]
  #   assert MarjorityElements2.majority_element(nums) == []
  # end

  # test "5" do
  #   nums = [3, 3, 4]
  #   assert MarjorityElements2.majority_element(nums) == [3]
  # end
end
