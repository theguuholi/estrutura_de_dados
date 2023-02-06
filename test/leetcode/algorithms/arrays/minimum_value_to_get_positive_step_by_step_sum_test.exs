defmodule Leetcode.Algorithms.MinimumValueToGetPositiveStepByStepSumTest do
  # minimum_value_to_get_positive_step_by_step_sum
  use ExUnit.Case
  alias Leetcode.Algorithms.MinimumValueToGetPositiveStepByStepSum
  #   var minStartValueGus = function(nums) {
  #     var startValue = 1;
  #     while(true){
  #         var total = startValue
  #         isValid = true

  #         for(const num of nums){
  #             total += num
  #             if(total <1){
  #                 isValid = false
  #                 break;
  #             }
  #         }
  #         if(isValid)
  #             return startValue;
  #             else
  #             startValue += 1;

  #     }
  # }

  # var nums = [-3,2, -3,4,2]
  # console.log(minStartValueGus(nums));

  test "reverse " do
    nums = [-3, 2, -3, 4, 2]
    assert MinimumValueToGetPositiveStepByStepSum.brute_force(nums) == 5
  end
end
