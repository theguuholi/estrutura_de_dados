defmodule Techniques.TwoPointer.Ex1Test do
  alias Techniques.TwoPointer.Ex1
  use ExUnit.Case

  test "two sum ex" do
    # nums = [3, 2, 3]
    # target = 6
    # assert Ex1.two_sum_two_pointers(nums, target) == [0, 2]

    nums = [2, 7, 11, 15]
    target = 9
    assert Ex1.two_sum_two_pointers(nums, target) == [0, 1]
  end
end
