defmodule Aula1.MeuMaxTest do
  use ExUnit.Case
  alias Aula1.MeuMax

  test "get_max" do
    expected = [1, 4, 9, 10, 4]
    assert MeuMax.execute(expected) == 10
  end
end
