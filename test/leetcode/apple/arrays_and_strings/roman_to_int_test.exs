defmodule Leetcode.Apple.ArraysAndStrings.RomanToIntTest do
  use ExUnit.Case

  alias Leetcode.Apple.ArraysAndStrings.RomanToInt

  test "1" do
    assert RomanToInt.roman_to_int_average("CDLXXVIII") == 478
    assert RomanToInt.roman_to_int_average("MCMXCIV") == 1994

    assert RomanToInt.roman_to_int("CDLXXVIII") == 478
    # assert RomanToInt.roman_to_int("MCMXCIV") == 1994
  end
end
