defmodule Leetcode.Algorithms.RunningSumOf1dArrayTest do
  use ExUnit.Case
  alias Leetcode.Algorithms.RunningSumOf1dArray

  test "squares " do
    nums = [3, 1, 2, 10, 1]
    assert RunningSumOf1dArray.execute(nums) == [3, 4, 6, 16, 17]
  end

  #   var runningSum = function(nums) {
  #     prefix = [nums[0]]
  #          for(i = 1; i < nums.length; i++){
  #          prefix.push(nums[i] + prefix[i - 1])
  #     }
  #     return prefix
  # };
end
