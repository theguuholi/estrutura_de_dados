defmodule Leetcode.Algorithms.Hash.MissingNumberTest do
  use ExUnit.Case
  alias Leetcode.Algorithms.Hash.MissingNumber

  test "greets the world" do
    nums = [3, 0, 1]
    assert MissingNumber.execute(nums) == 2
  end
end
