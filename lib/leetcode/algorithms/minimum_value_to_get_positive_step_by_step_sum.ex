defmodule Leetcode.Algorithms.MinimumValueToGetPositiveStepByStepSum do
  def brute_force(nums) do
    check_if_is_valid(nums, 0, true)
  end

  defp check_if_is_valid(_nums, start_value, false) do
    start_value + 1
  end

  defp check_if_is_valid(nums, start_value, is_valid) do
    {nums, is_valid, start_value} = validate(nums, start_value, is_valid)

    if is_valid do
      check_if_is_valid(nums, start_value + 1, true)
    else
      check_if_is_valid(nums, start_value, false)
    end
  end

  defp validate([h | t], start_value, is_valid) do
    (start_value + h < 1 && {t, false, start_value}) || {t, is_valid, start_value}
  end
end
