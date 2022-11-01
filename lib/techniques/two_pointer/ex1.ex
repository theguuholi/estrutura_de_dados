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
    arr_1
  end
end


# List<Integer> ans = new ArrayList<>();
# int i = 0;
# int j = 0;

# while (i < arr1.length && j < arr2.length) {
#     if (arr1[i] < arr2[j]) {
#         ans.add(arr1[i]);
#         i++;
#     } else {
#         ans.add(arr2[j]);
#         j++;
#     }
# }

# while (i < arr1.length) {
#     ans.add(arr1[i]);
#     i++;
# }

# while (j < arr2.length) {
#     ans.add(arr2[j]);
#     j++;
# }

# return ans;
