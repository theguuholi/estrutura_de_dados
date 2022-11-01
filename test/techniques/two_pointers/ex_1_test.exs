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
end
