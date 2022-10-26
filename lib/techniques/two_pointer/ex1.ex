defmodule Techniques.TwoPointer.Ex1 do
  def two_sum_two_pointers(nums, target) do
    pointer_one = 0
    pointer_two = length(nums) - 1

    rec(nums, pointer_one, pointer_two, target, :cont)
  end

  defp rec(_nums, pointer_one, pointer_two, _target, :halt), do: [pointer_one, pointer_two]

  defp rec(nums, pointer_one, pointer_two, target, :cont) do
    IO.inspect pointer_one
    IO.inspect Enum.at(nums, pointer_one)
    sum = Enum.at(nums, pointer_one) + Enum.at(nums, pointer_two)

    cond do
      sum == target ->
        rec(nums, pointer_one, pointer_two, target, :halt)

      sum > target ->
        rec(nums, pointer_one + 1, pointer_two, target, :cont)

      sum < target ->
        rec(nums, pointer_one, pointer_two + 1, target, :cont)
    end
  end
end
