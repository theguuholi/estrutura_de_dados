defmodule Leetcode.Apple.ArraysAndStrings.IntegerToRoman do
  # Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

  # Symbol       Value
  # I             1
  # V             5
  # X             10
  # L             50
  # C             100
  # D             500
  # M             1000
  # For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

  # Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

  # I can be placed before V (5) and X (10) to make 4 and 9.
  # X can be placed before L (50) and C (100) to make 40 and 90.
  # C can be placed before D (500) and M (1000) to make 400 and 900.
  # Given an integer, convert it to a roman numeral.

  @roman_decimal [
    M: 1000,
    CM: 900,
    D: 500,
    CD: 400,
    C: 100,
    XC: 90,
    L: 50,
    XL: 40,
    X: 10,
    IX: 9,
    V: 5,
    IV: 4,
    I: 1
  ]

  def int_to_roman_greedy(number) do
    numeral("", number, @roman_decimal)
  end

  def int_to_roman_hard_coded(num) do
    thousands = ["", "M", "MM", "MMM"]
    hundreds = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
    tens = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
    ones = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]

    hundreds_calc = num |> rem(1000) |> div(100)
    thousands_calc = div(num, 1000)
    tens_calc = num |> rem(100) |> div(10)
    ones_calc = num |> rem(10)

    Enum.at(thousands, thousands_calc) <>
      Enum.at(hundreds, hundreds_calc) <>
      Enum.at(tens, tens_calc) <> Enum.at(ones, ones_calc)
  end

  defp numeral(
         roman_acc,
         number,
         [{roman_numeral, decimal_value} | _t] = roman_to_decimal_mappings
       )
       when number >= decimal_value do
    roman_numeral = Atom.to_string(roman_numeral)
    roman_acc = roman_acc <> roman_numeral
    numeral(roman_acc, number - decimal_value, roman_to_decimal_mappings)
  end

  defp numeral(roman_acc, number, [_h | remaining_mappings]) do
    numeral(roman_acc, number, remaining_mappings)
  end

  defp numeral(roman_acc, _n, [] = _remaining_mappings), do: roman_acc
end
