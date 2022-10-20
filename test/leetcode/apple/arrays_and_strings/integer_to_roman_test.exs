defmodule Leetcode.Apple.ArraysAndStrings.IntegerToRomanTest do
  use ExUnit.Case
  alias Leetcode.Apple.ArraysAndStrings.IntegerToRoman

  test "1" do
    num = 478
    assert IntegerToRoman.int_to_roman_greedy(num) == "CDLXXVIII"
    assert IntegerToRoman.int_to_roman_hard_coded(num) == "CDLXXVIII"
  end

  # test "2" do
  #   num = 58
  #       assert IntegerToRoman.int_to_roman(num) == "LVIII"
  # end
  # test "3" do
  #   num = 1994
  #   assert IntegerToRoman.int_to_roman(num) == "MCMXCIV"
  # end
end
