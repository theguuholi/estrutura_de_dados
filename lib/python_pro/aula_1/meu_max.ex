defmodule Aula1.MeuMax do
  def execute(list, n \\ 0)
  def execute([], n), do: n

  def execute([head | tail], n) do
    n = (head > n && head) || n
    execute(tail, n)
  end
end
