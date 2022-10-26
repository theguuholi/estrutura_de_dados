defmodule Algoritmos.FindWord do
  def execute(payload) do
    payload
    |> rec("")
  end

  # defp rec([e], acc) do
  #   [f, _, l] = String.codepoints(e)
  #   acc <> f <> l
  # end

  defp rec([e | t], acc) do
    [f, _, _] = String.codepoints(e)
    acc = acc <>  f
    # rec(t, acc)
  end

end
