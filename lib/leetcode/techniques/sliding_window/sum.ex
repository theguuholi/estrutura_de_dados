defmodule Techniques.SlidingWindow.Sum do
  def execute(arr) do
    {_, hash_arr} =
      Enum.reduce(arr, {0, %{}}, fn e, {i, map} ->
        {i + 1, Map.put(map, i, e)}
      end)

    length = length(arr)

    arr
    |> Enum.reduce_while({0, 0}, fn e, {start_window, max_value} ->
      if start_window + 2 == length do
        next_1 = Map.get(hash_arr, start_window + 1)
        next_2 = Map.get(hash_arr, start_window + 2)

        if start_window + 2 >= length do
          current_sum = e + next_1
          max_value = max(max_value, current_sum)
          {:halt, {start_window, max_value}}
        else
          current_sum = e + next_1 + next_2
          max_value = max(max_value, current_sum)
          {:halt, {start_window, max_value}}
        end
      else
        next_1 = Map.get(hash_arr, start_window + 1)
        next_2 = Map.get(hash_arr, start_window + 2)
        current_sum = e + next_1 + next_2
        max_value = max(max_value, current_sum)
        {:cont, {start_window + 1, max_value}}
      end
    end)
    |> then(fn {_, e} -> e end)
  end
end
