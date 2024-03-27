defmodule Leetcode.Algorithms.Hash.MaxNumberOfBallonsTest do
  use ExUnit.Case

  alias Leetcode.Algorithms.Hash.MaxNumberOfBallons

  test "max number of ballons" do
    text = "nlaebolko"
    assert MaxNumberOfBallons.max_number_of_ballons(text) == 1
  end
end
