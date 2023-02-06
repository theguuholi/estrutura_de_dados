defmodule Leetcode.Apple.ArraysAndStrings.LongestSubstringWithoutRepeatingCharacters do
  # https://itnext.io/sliding-window-algorithm-technique-6001d5fbe8b3
  # https://medium.com/linkapi-solutions/o-que-%C3%A9-big-o-notation-32f171e4a045
  # https://itnext.io/sliding-window-algorithm-technique-6001d5fbe8b3
  # https://levelup.gitconnected.com/understanding-the-sliding-window-technique-in-algorithms-c6c3bf8226da
  # https://www.youtube.com/watch?v=MK-NZ4hN7rs

  def length_of_longest_substring(s) do
    s
    |> String.codepoints()
    |> Enum.reduce({0, 0, %{}, 0}, fn letter, {left, right, seen, final_result} ->
      case Map.get_and_update(seen, letter, &{&1, right}) do
        {char_value, seen} when char_value == nil or char_value < left ->
          actual_final_result = max(right - left + 1, final_result)
          {left, right + 1, seen, actual_final_result}

        {char_value, seen} ->
          {char_value + 1, right + 1, seen, final_result}
      end
    end)
    |> then(fn {_, _, _, r} -> r end)
  end

  # def length_of_longest_substring(s), do: l(s, 0, 0, %{}, 0, String.to_charlist(s))

  # def l(_s, _a, _b, _seen, len, []), do: len

  # def l(s, a, b, seen, len, [char | tail]) do
  # IO.inspect s, label: "s"
  # IO.inspect a, label: "a"
  # IO.inspect b, label: "b"
  # IO.inspect seen, label: "seen"
  # IO.inspect len, label: "len"
  # IO.inspect char, label: "char"
  # IO.inspect tail, label: "tail"
  # IO.inspect "++++++++++"
  # case Map.get_and_update(seen, char, &{&1, b}) |> IO.inspect() do

  # case Map.get_and_update(seen, char, &{&1, b}) do
  # {n, seen} when n == nil or n < a -> l(s, a, b + 1, seen, max(b - a + 1, len), tail)
  # {n, seen} -> l(s, n + 1, b + 1, seen, len, tail)
  # end
  #   seen
  #   |> Map.get_and_update(char, &{&1, b})
  #   |> rec_decision(s, a, b, len, tail)
  # end

  # defp rec_decision({n, seen}, s, a, b, len, tail) when n == nil or n < a do
  #   l(s, a, b + 1, seen, max(b - a + 1, len), tail)
  # end

  # defp rec_decision({n, seen}, s, _a, b, len, tail) do
  #   l(s, n + 1, b + 1, seen, len, tail)
  # end
end
