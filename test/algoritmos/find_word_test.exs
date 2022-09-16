defmodule Algoritmos.FindWordTest do
  use ExUnit.Case
  alias Algoritmos.FindWord

#   A precedence rule is given as “P>E”, which means that letter “P” is followed directly by the letter “E”. Write a function, given an array of precedence rules, that finds the word represented by the given rules.

# Note: Each represented word contains a set of unique characters, I.e. the word does not contain duplicate letters.

# Examples:

# 1. [“P>E”, “E>R”, “R>U”] - PERU
# 2. [“I>N”, A>I”, P>A”, S>P”, ] - SPAIN
# 3. [“I>F”, “W>I”, “S>W”, “F>T”, ] - SWIFT
# 4. [“R>T”, “A>L”, “P>O”, “O>R”, “G>A”, “T>U”, “U>G”, ] - Portugal
# 5. [“W>I”, “R>L”, “T>Z”, “Z>E”, “S>W”, “E>R”, “L>A”, “A>N”, “I>T”,] - SWITZERLAN

  test "greets the world" do
    payload = ["U>N", "G>A", "R>Y", "H>U", "N>G", "A>R"]
    assert FindWord.execute(payload) == "HUNGARY"
  end
end
