defmodule Leetcode.Apple.ArraysAndStrings.StringToInteger do
  #   Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer (similar to C/C++'s atoi function).

  # The algorithm for myAtoi(string s) is as follows:

  # Read in and ignore any leading whitespace.
  # Check if the next character (if not already at the end of the string) is '-' or '+'. Read this character in if it is either. This determines if the final result is negative or positive respectively. Assume the result is positive if neither is present.
  # Read in next the characters until the next non-digit character or the end of the input is reached. The rest of the string is ignored.
  # Convert these digits into an integer (i.e. "123" -> 123, "0032" -> 32). If no digits were read, then the integer is 0. Change the sign as necessary (from step 2).
  # If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then clamp the integer so that it remains in the range. Specifically, integers less than -231 should be clamped to -231, and integers greater than 231 - 1 should be clamped to 231 - 1.
  # Return the integer as the final result.
  # Note:

  # Only the space character ' ' is considered a whitespace character.
  # Do not ignore any characters other than the leading whitespace or the rest of the string after the digits.
  @uper_range Integer.pow(2, 31) - 1
  @lower_range Integer.pow(2, 31) * -1
  @spec my_atoi(s :: String.t()) :: integer
  def my_atoi(s) do
    s
    |> trim_from_left_and_until_nom_digit()
    |> Integer.parse()
    |> elem(0)
    |> case do
      num when num > @uper_range ->
        @uper_range

      num when num < @lower_range ->
        @lower_range

      num ->
        num
    end
  end

  defp trim_from_left_and_until_nom_digit(s) do
    trim_from_left_and_until_nom_digit(s, "", false)
  end

  defp trim_from_left_and_until_nom_digit(<<>>, _, _), do: "0"

  defp trim_from_left_and_until_nom_digit(<<" ", rest::binary>>, "", false) do
    trim_from_left_and_until_nom_digit(rest, "", false)
  end

  defp trim_from_left_and_until_nom_digit(<<"-", rest::binary>>, "", false) do
    trim_from_left_and_until_nom_digit(rest, "-", true)
  end

  defp trim_from_left_and_until_nom_digit(<<"+", rest::binary>>, "", false) do
    trim_from_left_and_until_nom_digit(rest, "+", true)
  end

  defp trim_from_left_and_until_nom_digit(<<char, _rest::binary>> = s, acc, false) do
    if Regex.match?(~r/\d/, List.to_string([char])) do
      trim_from_left_and_until_nom_digit(s, acc, true)
    else
      trim_from_left_and_until_nom_digit("0", "", true)
    end
  end

  defp trim_from_left_and_until_nom_digit(<<char, _rest::binary>> = s, acc, true) do
    if Regex.match?(~r/\d/, List.to_string([char])) do
      acc <> s
    else
      "0"
    end
  end
end
