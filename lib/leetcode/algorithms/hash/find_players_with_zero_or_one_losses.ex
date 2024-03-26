defmodule Leetcode.Algorithms.Hash.FindPlayersWithZeroOrOneLosses do
  def execute(matches) do
    [ws, ds] =
      matches
      # split winners and loosers
      |> Enum.zip_with(& &1)
      |> Enum.map(&convert_frequencies_to_list/1)

    winners = get_winners_losers(ws)
    loosers = get_winners_losers(ds)
    return_winners = Enum.sort(winners -- loosers)
    return_loosers = return_loosers(ds)

    [
      return_winners,
      return_loosers
    ]
  end

  defp return_loosers(list) do
    list
    |> Enum.reduce([], fn {player, freq}, acc ->
      if freq == 1 do
        [player | acc]
      else
        acc
      end
    end)
    |> Enum.sort()

    #  Enum.filter(ds, &(elem(&1, 1) == 1)) |> Enum.map(&elem(&1, 0)) |> Enum.sort()
  end

  defp get_winners_losers(list) do
    Enum.map(list, &elem(&1, 0))
  end

  defp convert_frequencies_to_list(list) do
    list
    |> Enum.frequencies()
    |> Map.to_list()
  end

  # def execute(arr) do
  #   result =
  #     arr
  #     |> Enum.reduce(%{}, fn [winner, looser], acc ->
  #       acc
  #       |> Map.update(winner, %{win: 1, lose: 0}, fn %{win: win, lose: lose} ->
  #         %{win: win + 1, lose: lose}
  #       end)
  #       |> Map.update(looser, %{win: 0, lose: 1}, fn %{win: win, lose: lose} ->
  #         %{win: win, lose: lose + 1}
  #       end)
  #     end)
  #     |> Map.to_list()

  #   winners =
  #     result
  #     |> Enum.filter(fn {_, %{win: win, lose: lose}} -> win > 0 and lose == 0 end)
  #     |> Enum.map(fn {player, _} -> player end)

  #   loosers =
  #     result
  #     |> Enum.filter(fn {_, %{win: _win, lose: lose}} -> lose == 1 end)
  #     |> Enum.map(fn {player, _} -> player end)

  #   [winners, loosers]
  # end
end
