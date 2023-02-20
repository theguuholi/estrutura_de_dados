defmodule Leetcode.Algorithms.Hash.SubArrayEqualsK do
  def subarray_sum(nums, k) do
    {_map, _curr, ans} =
      Enum.reduce(nums, {%{0 => 1}, 0, 0}, fn num, {map, curr, ans} ->
        curr = curr + num
        key = curr - k
        ans = ans + Map.get(map, key, 0)
        map = Map.update(map, curr, 1, &(&1 + 1))
        {map, curr, ans}
      end)

    ans
  end
end
