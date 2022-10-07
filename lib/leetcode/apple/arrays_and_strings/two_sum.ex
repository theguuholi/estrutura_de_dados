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

  # linear

  def two_sum_linear(nums, target) do
    Enum.reduce_while(nums, {0, %{}}, fn num, {index, map} ->
      value_missing_to_target = target - num

      if Map.has_key?(map, value_missing_to_target) do
        index_value = Map.get(map, value_missing_to_target)
        result = (index > index_value && [index_value, index]) || [index, index_value]
        {:halt, result}
      else
        map = Map.put(map, num, index)
        acc = {index + 1, map}
        {:cont, acc}
      end
    end)
  end
end
