defmodule Leetcode.Algorithms.Hash.SubArrayEqualsKTest do
  use ExUnit.Case
  alias Leetcode.Algorithms.Hash.SubArrayEqualsK

  #JS
  # var subarraySum = function(nums, k) {
  #     let counts = new Map();
  #     counts.set(0, 1);
  #     let ans = 0, curr = 0;
  #     for (const num of nums) {
  #         curr += num;
  #         ans += counts.get(curr - k) || 0;
  #         counts.set(curr, (counts.get(curr) || 0) + 1);
  #     }
  #     return ans;
  # };

  test "greets the world" do
    nums = [1,1,1]
     k = 2
    assert SubArrayEqualsK.subarray_sum(nums, k) == 2
  end
end
