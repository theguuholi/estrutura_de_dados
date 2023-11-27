defmodule Leetcode.Algorithms.Hash.FindPlayersWithZeroOrOneLosses do
  def execute(arr) do
    result =
      arr
      |> Enum.reduce(%{}, fn [winner, looser], acc ->
        acc
        |> Map.update(winner, %{win: 1, lose: 0}, fn %{win: win, lose: lose} ->
          %{win: win + 1, lose: lose}
        end)
        |> Map.update(looser, %{win: 0, lose: 1}, fn %{win: win, lose: lose} ->
          %{win: win, lose: lose + 1}
        end)
      end)
      |> Map.to_list()

    winners =
      result
      |> Enum.filter(fn {_, %{win: win, lose: lose}} -> win > 0 and lose == 0 end)
      |> Enum.map(fn {player, _} -> player end)

    loosers =
      result
      |> Enum.filter(fn {_, %{win: _win, lose: lose}} -> lose == 1 end)
      |> Enum.map(fn {player, _} -> player end)

    [winners, loosers]
  end
end
