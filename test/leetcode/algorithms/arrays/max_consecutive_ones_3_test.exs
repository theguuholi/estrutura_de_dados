defmodule Leetcode.Algorithms.MaxConsecutiveOnes3Test do
  use ExUnit.Case
  alias Leetcode.Algorithms.MaxConsecutiveOnes3

  test "first" do
    nums = [1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0]
    k = 2
    assert MaxConsecutiveOnes3.execute(nums, k) == 6
  end

  # longest = function logestOnes(nums, k) {
  #   left = 0; //0
  #   for(right = 0; right < nums.length; right ++){
  #       if(nums[right] == 0){ //
  #           k--;
  #       }
  #       if(k < 0){
  #           k += 1 - nums[left];
  #           left ++
  #       }
  #   }
  #   return right - left;}

  #   nums = [0, 1, 1, 0]
  #   k = 1
  #   console.log(longest(nums, k));
end
