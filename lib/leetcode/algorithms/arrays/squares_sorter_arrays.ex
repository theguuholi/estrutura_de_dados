defmodule Leetcode.Algorithms.SquaresSorterArrays do
  def execute(nums) do
    nums
    |> Enum.reduce([], fn n, acc ->
      n = :math.pow(n, 2) |> trunc()
      acc ++ [n]
    end)
    |> Enum.sort()
  end
end
