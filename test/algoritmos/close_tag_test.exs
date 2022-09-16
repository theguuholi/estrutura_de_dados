defmodule Algoritmos.CloseTagTest do
  use ExUnit.Case
  alias Algoritmos.CloseTag

  test "greets the world" do
    payload = "<app></app></app></app>"
    assert CloseTag.count_missing_tags(payload) == 2
  end

  test "greets the world 2" do
    payload = "<app></app><app></app>"
    assert CloseTag.count_missing_tags(payload) == 0
  end

  test "greets the world 3" do
    payload = "<app></app><app><app>"
    assert CloseTag.count_missing_tags(payload) == 2
  end

  test "greets the world 4" do
    payload = "</app><app><app>"
    assert CloseTag.count_missing_tags(payload) == 3
  end
end
