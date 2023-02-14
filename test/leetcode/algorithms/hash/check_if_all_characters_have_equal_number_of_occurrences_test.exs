defmodule Leetcode.Algorithms.Hash.CheckIfAllCharactersHaveEqualNumberOfOccurrencesTest do
  use ExUnit.Case
  alias Leetcode.Algorithms.Hash.CheckIfAllCharactersHaveEqualNumberOfOccurrences

  # Given a string s, determine if all characters have the same frequency.
  # For example, given s = "abacbc", return true. All characters appear twice.
  # Given s = "aaabb", return false. "a" appears 3 times, "b" appears 2 times. 3 != 2.

  # JS
  #   var areOccurrencesEqual = function(s) {
  #     let counts = new Map();
  #     for (const c of s) {
  #         counts.set(c, (counts.get(c) || 0) + 1);
  #     }
  #     let frequencies = new Set();
  #     for (const val of counts.values()) {
  #         frequencies.add(val);
  #     }
  #     return frequencies.size == 1;
  # };

  test "greets the world" do
    s = "abacbc"
    assert CheckIfAllCharactersHaveEqualNumberOfOccurrences.execute(s) == true
  end

  test "greets the world sdfds" do
    s = "aaabb"
    assert CheckIfAllCharactersHaveEqualNumberOfOccurrences.execute(s) == false
  end
end
