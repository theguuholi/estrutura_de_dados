defmodule Leetcode.Algorithms.Hash.Pangram do
  def execute(s) do
    s
    |> String.graphemes()
    |> Enum.reduce(%{}, fn e, hash ->
      Map.update(hash, e, 1, & &1)
    end)
    |> Map.values()
    |> Enum.count()
    |> then(&(&1 == 26))
  end
end
