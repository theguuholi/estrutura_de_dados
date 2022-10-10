defmodule Techniques.SlidingWindow.SumTest do
  alias Techniques.SlidingWindow.Sum

  # things we iterate over sequentially:
  # - contiguous sequence of elements,
  # - strings, arrays, linked list
  # - min, max, longest, shortest, contained
  # - maybe we need to calculate something

  use ExUnit.Case

  test "get_max from an array of sub 3" do
    assert Sum.execute([4, 2, 1, 7, 8, 1, 2, 8, 1, 0]) == 16
  end

end
