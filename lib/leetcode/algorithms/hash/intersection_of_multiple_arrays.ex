defmodule Leetcode.Algorithms.Hash.IntersectionOfMultipleArrays do
  def execute(nums) do
    length = length(nums)

    nums
    |> Enum.reduce(%{}, fn arr, count ->
      Enum.reduce(arr, count, fn x, count ->
        Map.update(count, x, 1, &(&1 + 1))
      end)
    end)
    |> Map.to_list()
    |> Enum.reduce([], fn {k, v}, acc ->
      (v == length && acc ++ [k]) || acc
    end)
    |> Enum.sort()
  end
end
