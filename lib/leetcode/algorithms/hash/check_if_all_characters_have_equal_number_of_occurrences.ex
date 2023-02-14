defmodule Leetcode.Algorithms.Hash.CheckIfAllCharactersHaveEqualNumberOfOccurrences do
  def execute(s) do
    arr = String.codepoints(s)

    Enum.reduce(arr, %{}, fn e, map ->
      Map.update(map, e, 1, &(&1 + 1))
    end)
    |> Map.values()
    |> then(fn list ->
      [f | rest] = list
      Enum.all?(rest, &(&1 == f))
    end)
  end
end
