defmodule Leetcode.Easy.ClibStairsTest do
  use ExUnit.Case
  alias Leetcode.Easy.ClimbStairs

  test "greets the world O(n2)" do
    assert ClimbStairs.execute(5) == 8
  end
end
