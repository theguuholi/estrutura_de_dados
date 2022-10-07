defmodule Leetcode.Apple.ArraysAndStrings.LongestSubstringWithoutRepeatingCharacters do
  def length_of_longest_substring(s) do
    s
    |> String.codepoints()
    |> Enum.reduce("", fn l, acc ->
      if String.contains?(acc, l) do
        IO.inspect acc
        ""
      else
        acc = acc <> l
        IO.inspect acc, label: "l"
      end
    end)
    |> String.length()
  end
end
