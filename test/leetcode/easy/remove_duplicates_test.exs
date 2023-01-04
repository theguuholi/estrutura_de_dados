
defmodule Leetcode.Easy.RemoveDuplicatesTest do
  use ExUnit.Case
  alias Leetcode.Easy.RemoveDuplicates
  # var removeDuplicates = function(nums) {
#   for(let i=0;i<nums.length;){
#       if(nums[i] ===nums[i+1]){
#           nums.splice(i,1)
#       }else{
#           i++
#       }
#   }
#  };

  test "greets the world O(n2)" do
    nums = [1,1,2]
    assert RemoveDuplicates.execute(nums) == [1, 2]
  end
end
