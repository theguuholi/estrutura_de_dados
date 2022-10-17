defmodule Leetcode.Apple.ArraysAndStrings.IntegerToRomanTest do
  use ExUnit.Case
  alias Leetcode.Apple.ArraysAndStrings.IntegerToRoman

  test "1" do
    num = 3
    assert IntegerToRoman.int_to_roman(num) == "III"
  end

  test "2" do
    num = 58
        assert IntegerToRoman.int_to_roman(num) == "LVIII"
  end
  test "3" do
    num = 1994
    assert IntegerToRoman.int_to_roman(num) == "MCMXCIV"
  end
end
