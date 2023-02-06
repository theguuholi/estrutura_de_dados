defmodule Leetcode.Algorithms.Hash.CountingElementsTest do
  use ExUnit.Case
  alias Leetcode.Algorithms.Hash.CountingElements

  test "greets the world" do
    arr = [1,2,3]
    assert CountingElements.execute(arr) == 2
  end

  test "greets the world sdfds" do
    arr = [1,3,2,3,5,0]
    assert CountingElements.execute(arr) == 3
  end

  # test "greets the world k" do
  #   arr = [1,1,1,1,1,3,3,3,3,3,3,5,5,5,5,5,5]
  #   assert CountingElements.execute(arr) == 0
  # end

  # test "greets the world ks" do
  #   arr = [1,1,1,1,1,2]
  #   assert CountingElements.execute(arr) == 5
  # end
end
