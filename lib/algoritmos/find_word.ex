defmodule Algoritmos.FindWord do
  def execute(payload) do
    payload
    |> Enum.reduce("", fn s, acc ->
      [l, _, _n] = String.codepoints(s)
      acc <> l
    end)
  end
end
