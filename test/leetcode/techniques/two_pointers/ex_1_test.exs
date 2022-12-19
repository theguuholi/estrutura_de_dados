defmodule Techniques.TwoPointer.Ex1Test do
  alias Techniques.TwoPointers.Ex1
  use ExUnit.Case

  test "two sum ex" do
    nums = [1, 2, 4, 6, 8, 9, 14, 15]
    target = 13
    assert Ex1.check_for_target(nums, target) == [4, 9]
  end

  test "palindrome" do
    assert Ex1.palindrome("racecar") == true
    assert Ex1.palindrome("asdfasdf") == false
  end

  test "ans" do
    arr_1 = [1, 4, 7, 20, 38]
    arr_2 = [3, 5, 6, 17]

    assert Ex1.ans(arr_1, arr_2) == Enum.sort(arr_1 ++ arr_2)
  end

  # Remember that the methods laid out here are just guidelines.
  #  For example, in the first method, we started the pointers at the first and last index,
  #  but sometimes you might find a problem that involves starting the pointers at different indices.
  #  In the second method, we moved two pointers forward along two different inputs. Sometimes,
  #  there will only be one input array/string, but we still initialize both pointers at the first index
  #  and move both of them forward.
  # Two pointers just refers to using two integer variables to move along some iterables.
  # The strategies we looked at in this article are the most common patterns, but always be on the lookout
  #  for a different way to approach a problem.
end
