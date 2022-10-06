defmodule Leetcode.Apple.ArraysAndStrings.TwoSum do
  def two_sum(nums, target) do
    nums = nums |> Enum.with_index()
    [_ | nums_2] = nums
    rec(nums, nums_2, target)
  end

  def rec([], [], {:halt, result}), do: result

  def rec([n1 | nums], nums_2, target) do
    case rec_2(n1, nums_2, target) do
      {:halt, result} ->
        rec([], [], {:halt, result})

      {:cont, _target} ->
        [_ | nums_2] = nums_2
        rec(nums, nums_2, target)
    end
  end

  def rec_2(nil, [], {:halt, _} = total), do: total

  def rec_2({_, _}, [], target), do: {:cont, target}

  def rec_2({n1, i1}, [{n2, i2} | nums_2], target) do
    if n1 + n2 == target do
      rec_2(nil, [], {:halt, [i1, i2]})
    else
      rec_2({n1, i1}, nums_2, target)
    end
  end
end
