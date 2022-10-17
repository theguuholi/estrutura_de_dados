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

  def int_to_roman(num) do
    num
    |> Integer.digits()
    |> calculate_roman()
    |> then(fn {v, _} -> v end)
  end

  defp calculate_roman(num) do
    length = length(num)

    Enum.reduce(num, {"", length}, fn n, {acc, l} ->
      add =
        cond do
          l == 1 and n < 10 -> to_nine(n)
          l == 2 -> to_m(n)
          l == 3 -> to_x(n)
          l == 4 -> to_x(n)
        end

      {acc <> add, l - 1}
    end)
  end

  defp to_x(n) do
    IO.inspect n
  end

  defp to_m(n) do
    cond do
      n < 4 -> Enum.reduce(1..n, "", fn _, acc -> acc <> "X" end)
      n == 5 -> "L"
    end
  end

  defp to_nine(n) do
    cond do
      n < 4 ->
        Enum.reduce(1..n, "", fn _, acc -> acc <> "I" end)

      n == 4 ->
        "IV"

      n == 5 ->
        "V"

      n > 5 ->
        rest = n - 5
        "V" <> Enum.reduce(1..rest, "", fn _, acc -> acc <> "I" end)
    end
  end
end
