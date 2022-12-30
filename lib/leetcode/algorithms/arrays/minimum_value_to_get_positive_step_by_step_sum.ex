defmodule Leetcode.Algorithms.MinimumValueToGetPositiveStepByStepSum do
  def brute_force(nums) do
    check_if_is_valid(nums, 1, false)
  end

  defp check_if_is_valid(nums, start_value, false) do
    is_valid =
      Enum.reduce_while(nums, start_value, fn num, total ->
        total = total + num

        if total < 1 do
          {:halt, false}
        else
          {:cont, total}
        end
      end)

    if is_valid do
      check_if_is_valid(nums, start_value, true)
    else
      check_if_is_valid(nums, start_value + 1, false)
    end
  end

  defp check_if_is_valid(_nums, start_value, true), do: start_value
end
