defmodule Techniques.SlidingWindow do
  def find_length(nums, k) do
    # nums_length = length(nums) - 1
    # Enum.reduce(nums, {0, nums_length, 0, ans}, fn e, {left, right, curr, ans} ->

    # end)
  end

  # var findLength = function(nums, k) {
  #   let left = 0, curr = 0, ans = 0;
  #   for (let right = 0; right < nums.length; right++) {
  #       curr += nums[right];
  #       while (curr > k) {
  #           curr -= nums[left];
  #           left++;
  #       }

  #       ans = Math.max(ans, right - left + 1);
  #   }
  #   return ans;
  # }
end
