defmodule Leetcode.Algorithms.Hash.MissingNumber do
  def execute(nums) do
    {_, hash} =
      Enum.reduce(nums, {0, %{}}, fn e, {i, hash} ->
        {i + 1, Map.put(hash, e, i)}
      end)

    Enum.reduce_while(nums, 0, fn _, i ->
      if Map.has_key?(hash, i) do
        {:cont, i + 1}
      else
        {:halt, i}
      end
    end)
  end
end
