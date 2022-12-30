defmodule Leetcode.Algorithms.RunningSumOf1dArray do
  def execute(nums) do
    {prefix, _} =
      Enum.reduce(nums, {[], 0}, fn e, {prefix, actual} ->
        actual = e + actual
        prefix = prefix ++ [actual]
        {prefix, actual}
      end)

    prefix
  end
end
