defmodule Leetcode.Apple.ArraysAndStrings.MarjorityElements2 do
  def majority_element(nums) do
    Enum.reduce(nums, %{}, fn n, map ->
      Map.update(map, n, 1, &(&1 + 1))
    end)
    |> Map.to_list()
    # |> Enum.sort(fn {e, r} -> )
    |> IO.inspect()
    |> then(fn [f | rest] ->
      {_, r} = f
      list = Enum.filter(rest, fn {_, e} -> e == r end)

      if length(list) < 2 do
        list = list ++ [f]
        Enum.map(list, fn {e, _} -> e end)
      else
        []
      end
    end)
  end
end
