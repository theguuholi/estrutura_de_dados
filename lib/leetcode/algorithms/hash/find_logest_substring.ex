defmodule Leetcode.Algorithms.Hash.FindLogestSubstring do
  def execute(s, k) do
    s = String.codepoints(s)
    counts = %{}

    {left, ans} =
      Enum.reduce(s, {0, 0}, fn char, {left, ans} ->
        counts = Map.update(counts, char, 1, &(&1 + 1))

        {left, ans} =
          if length(Map.keys(counts)) > k do
            {Map.update(counts, hd(Map.keys(counts)), -1, &(&1 - 1)), left + 1,
             max(ans, String.length(s) - left)}
          else
            {counts, left, ans}
          end

        {left, ans}
      end)

    ans
  end
end
