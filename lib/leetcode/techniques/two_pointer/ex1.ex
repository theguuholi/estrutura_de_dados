defmodule Techniques.TwoPointers.Ex1 do
  def check_for_target(nums, target) do
    left = 0
    right = length(nums) - 1
    get_target(nums, left, right, target, :cont)
  end

  def get_target(nums, left, right, target, :cont) when left < right do
    left_value = Enum.at(nums, left)
    right_value = Enum.at(nums, right)
    current = left_value + right_value

    cond do
      current == target ->
        get_target(nums, left_value, right_value, target, :halt)

      current > target ->
        get_target(nums, left, right - 1, target, :cont)

      true ->
        get_target(nums, left + 1, right, target, :cont)
    end
  end

  def get_target(_, l, r, _, :halt), do: [l, r]
  def get_target(_, _, _, _, :cont), do: false

  def palindrome(string) do
    list = String.codepoints(string)
    last = length(list) - 1
    rec(list, 0, last, true)
  end

  def rec(_, _, _, false), do: false
  def rec(_, _, 0, result), do: result

  def rec(list, left, right, true) do
    left_v = Enum.at(list, left)
    right_v = Enum.at(list, right)

    (left_v == right_v && rec(list, left + 1, right - 1, true)) || rec(list, left, right, false)
  end

  ####

  def ans(arr_1, arr_2) do
    arr_1_lengh = length(arr_1)
    arr_2_lengh = length(arr_2)

    ans_rec(arr_1, arr_2, arr_1_lengh, arr_2_lengh, 0, 0, [])
  end

  defp ans_rec(arr_1, arr_2, arr_1_lengh, arr_2_lengh, i, j, list)
       when i < arr_1_lengh and j < arr_2_lengh do
    value_i = Enum.at(arr_1, i)
    value_j = Enum.at(arr_2, j)

    if value_i < value_j do
      list = list ++ [value_i]
      ans_rec(arr_1, arr_2, arr_1_lengh, arr_2_lengh, i + 1, j, list)
    else
      list = list ++ [value_j]
      ans_rec(arr_1, arr_2, arr_1_lengh, arr_2_lengh, i, j + 1, list)
    end
  end

  defp ans_rec(arr_1, arr_2, _arr_1_lengh, _arr_2_lengh, i, j, list) do
    arr_1 = Enum.drop(arr_1, i)
    list = list ++ arr_1
    arr_2 = Enum.drop(arr_2, j)
    list ++ arr_2
  end


end
