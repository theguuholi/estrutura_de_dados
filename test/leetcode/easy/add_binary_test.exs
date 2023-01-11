
defmodule Leetcode.Easy.AddBinaryTest do
  use ExUnit.Case
  alias Leetcode.Easy.AddBinary
  test "greets the world O(n2)" do
    a = "11"
     b = "1"
    assert AddBinary.execute(a, b) == "100"
  end
end
