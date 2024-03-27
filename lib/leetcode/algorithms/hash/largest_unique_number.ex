defmodule Leetcode.Algorithms.Hash.LargestUniqueNumber do
  # def largest_unique_number(nums) do
  #   nums
  #   |> Enum.frequencies()
  #   |> Map.to_list()
  #   |> Enum.filter(fn {_, freq} -> freq == 1 end)
  #   |> Enum.map(fn {num, _} -> num end)
  #   |> Enum.max()
  # end

  def largest_unique_number(nums) do
    nums
    |> Enum.reduce(%{}, fn num, acc ->
      Map.update(acc, num, 1, &(&1 + 1))
    end)
    |> Enum.filter(fn {_, freq} -> freq == 1 end)
    |> then(fn list ->
      if Enum.empty?(list) do
        -1
      else
        list
        |> Enum.map(fn {num, _} -> num end)
        |> Enum.max()
      end
    end)
  end
end
