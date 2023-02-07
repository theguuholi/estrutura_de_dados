defmodule Leetcode.Algorithms.Hash.IntersectionOfMultipleArrays do
  def execute(arr) do
    Enum.reduce(arr, arr, fn e, acc ->
      Enum.map(acc, fn r -> e -- r end)
    end)

    # r_1 = l1 -- l2

    # l1 = l1 -- r_1
    # l2 = l2 -- r_1
    # l3 = l3 -- r_1

    # r_2 = l2 -- l3
    # l1 = l1 -- r_2
    # l2 = l2 -- r_2
    # l3 = l3 -- r_2

    # r3 = l3 -- l2

    # l1 = l1 -- r3
    # l2 = l2 -- r3
    # l3 = l3 -- r3

    # l1
  end
end
