defmodule Algoritmos.CloseTag do
  def count_missing_tags(payload) do
    payload
    |> String.split("<app></app>", trim: true)
    |> handle_count()
  end

  def handle_count([]), do: 0

  def handle_count([rest]) do
    cond do
      String.contains?(rest, "<app>") -> calc(rest, 5)
      String.contains?(rest, "</app>") -> calc(rest, 6)
    end
  end

  def calc(rest, v) do
    rest
    |> String.codepoints()
    |> Enum.count()
    |> Kernel.div(v)
  end
end
