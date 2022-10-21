defmodule Leetcode.Apple.ArraysAndStrings.RomanToInt do
  @mapping %{
    ?I => 1,
    ?V => 5,
    ?X => 10,
    ?L => 50,
    ?C => 100,
    ?D => 500,
    ?M => 1000
  }

  def roman_to_int(s) do
    ian(s, {0, nil})
  end

  defp ian("", {total, _prev}), do: total

  defp ian(<<char, rest::binary>>, {total, prev}) do
    roman_letter_value = @mapping[char]

    if roman_letter_value > prev do
      comp = {total + roman_letter_value - 2 * prev, roman_letter_value}
      ian(rest, comp)
    else
      comp = {total + roman_letter_value, roman_letter_value}
      ian(rest, comp)
    end
  end

  # =========================

  @romans %{
    "M" => 1000,
    "D" => 500,
    "C" => 100,
    "L" => 50,
    "X" => 10,
    "V" => 5,
    "I" => 1
  }
  def roman_to_int_average(s) do
    s
    |> String.codepoints()
    |> Enum.reverse()
    |> rec(0)
  end

  defp rec([], value), do: value
  defp rec([l], value), do: Map.get(@romans, l) + value

  defp rec([first, second | t], value) do
    first_value = Map.get(@romans, first)
    second_value = Map.get(@romans, second)

    if first_value > second_value do
      current_value = first_value - second_value
      value = value + current_value
      rec(t, value)
    else
      list = [second] ++ t
      value = value + first_value
      rec(list, value)
    end
  end
end
