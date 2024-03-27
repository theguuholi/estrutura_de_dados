defmodule Leetcode.Algorithms.Hash.FindPlayersWithZeroOrOneLossesTest do
  use ExUnit.Case
  alias Leetcode.Algorithms.Hash.FindPlayersWithZeroOrOneLosses

  test "greets the world" do
    matches = [[1, 3], [2, 3], [3, 6], [5, 6], [5, 7], [4, 5], [4, 8], [4, 9], [10, 4], [10, 9]]
    assert FindPlayersWithZeroOrOneLosses.execute(matches) == [[1, 2, 10], [4, 5, 7, 8]]
  end

end
