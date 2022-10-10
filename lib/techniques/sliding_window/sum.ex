defmodule Techniques.SlidingWindow.Sum do
  def execute(arr) do
    arr
    |> Enum.reduce({0, 0, 0, 0}, fn e, {start_window, end_window, current_sum, max} ->
      IO.inspect start_window
      IO.inspect end_window
      IO.inspect "111"
      if end_window - start_window <= 2  do
        current_sum = e + current_sum
        IO.inspect
        max = (current_sum > max && current_sum) || max
        {start_window, end_window + 1, current_sum, max}
      else
        {start_window + 1, start_window + 1, 0, max}
      end
    end)
  end
end
