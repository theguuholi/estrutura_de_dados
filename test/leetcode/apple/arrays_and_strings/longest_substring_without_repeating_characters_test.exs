defmodule Leetcode.Apple.ArraysAndStrings.LongestSubstringWithoutRepeatingCharactersTest do
  use ExUnit.Case
  alias Leetcode.Apple.ArraysAndStrings.LongestSubstringWithoutRepeatingCharacters

  # Given a string s, find the length of the longest substring without repeating characters.

  test "1" do
    s = "abcabcbb"
    assert LongestSubstringWithoutRepeatingCharacters.length_of_longest_substring(s) == 3
  end

  test "2" do
    s = "pwwkew"
    assert LongestSubstringWithoutRepeatingCharacters.length_of_longest_substring(s) == 3
  end

  test "3" do
    s = "bbbbbbb"
    assert LongestSubstringWithoutRepeatingCharacters.length_of_longest_substring(s) == 1
    # assert LongestSubstringWithoutRepeatingCharactexrs.length_of_longest_substring("tmmzuxt") == 5
  end
end
