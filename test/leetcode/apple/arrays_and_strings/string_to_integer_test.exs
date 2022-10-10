defmodule Leetcode.Apple.ArraysAndStrings.StringToIntegerTest do
  use ExUnit.Case
  alias Leetcode.Apple.ArraysAndStrings.StringToInteger

  test "1" do
    s = "42"
    assert StringToInteger.my_atoi(s) == 42
  end

  test "2" do
    s = "   -42"
    assert StringToInteger.my_atoi(s) == -42
  end

  test "3" do
    s = "4193 with words"
    assert StringToInteger.my_atoi(s) == 4193
  end

  test "4" do
    s = "words and 987"
    assert StringToInteger.my_atoi(s) == 0
  end
end
