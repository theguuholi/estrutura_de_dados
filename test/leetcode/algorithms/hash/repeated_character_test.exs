defmodule Leetcode.Algorithms.Hash.RepeatedCharracterTest do
  use ExUnit.Case
  alias Leetcode.Algorithms.Hash.RepeatedCharacter

  #     # 1
  # Given a string s consisting of lowercase English letters, return the first letter to appear twice.
  # Note:
  # A letter a appears twice before another letter b if the second occurrence of a is before the second occurrence of b.
  # s will contain at least one letter that appears twice.

  # ## JS Brute Force
  # var repeatedCharacter = function(s) {
  #     for(i = 0; i < s.length; i++){
  #         c = s[i]
  #         for(j = 0; j < i; j++){
  #             if(s[j] == c) {
  #                 return c;
  #             }
  #         }
  #     }
  #     return "";
  # };

  test "greets the world" do
    s = "abccbaacz"
    assert RepeatedCharacter.execute(s) == "c"
  end
end
