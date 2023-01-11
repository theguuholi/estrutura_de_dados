defmodule Leetcode.Algorithms.Hash.PangramTest do
  use ExUnit.Case
  alias Leetcode.Algorithms.Hash.Pangram

  test "greets the world" do
    sentence = "thequickbrownfoxjumpsoverthelazydog"
    assert Pangram.execute(sentence) == true
  end
end

# var checkIfPangram = function(sentence) {
#   sentence.split("")
#   let seen = new Set();
#    for (const c of sentence) {
#       seen.add(c);
#   }
#   return seen.size == 26
# };
