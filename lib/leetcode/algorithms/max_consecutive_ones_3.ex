defmodule Leetcode.Algorithms.MaxConsecutiveOnes3 do
  def execute(nums, k) do
    {_k, l} =
      Enum.reduce(nums, {k, 0}, fn n, {k, l} ->
        k = (n == 0 && k - 1) || k
        if k < 0 do
          {k + 1 - Enum.at(nums, l), l + 1}
        else
          {k, l}
        end
      end)

    length(nums) - l
  end
end
